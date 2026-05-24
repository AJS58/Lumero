
const APP_VERSION = "0.3.0";
const UPDATE_URL = "version.json";
let state = { tab: "dashboard", scanCount: Number(localStorage.getItem("lumero_scan_count")||0), lastScan: localStorage.getItem("lumero_last_scan")||"Not scanned yet" };

function qs(s){return document.querySelector(s)}
function qsa(s){return [...document.querySelectorAll(s)]}
function toast(msg){const t=qs("#toast");t.textContent=msg;t.classList.add("show");setTimeout(()=>t.classList.remove("show"),2600)}
function showTab(tab){
  state.tab=tab;
  qsa(".section").forEach(x=>x.classList.toggle("active", x.id===tab));
  qsa("[data-tab]").forEach(x=>x.classList.toggle("active", x.dataset.tab===tab));
  location.hash=tab;
}
function initTabs(){qsa("[data-tab]").forEach(b=>b.addEventListener("click",()=>showTab(b.dataset.tab))); if(location.hash) showTab(location.hash.replace("#","")); else showTab("dashboard");}
function runScan(){
  const overlay=qs("#scanOverlay"); overlay.style.display="grid";
  const phrases=["Checking photo patterns…","Analysing screenshots…","Estimating clutter score…","Preparing recommendations…"];
  let i=0; qs("#scanText").textContent=phrases[0];
  const timer=setInterval(()=>{i=(i+1)%phrases.length;qs("#scanText").textContent=phrases[i]},650);
  setTimeout(()=>{
    clearInterval(timer); overlay.style.display="none";
    state.scanCount++; state.lastScan=new Date().toLocaleString();
    localStorage.setItem("lumero_scan_count",state.scanCount);
    localStorage.setItem("lumero_last_scan",state.lastScan);
    qs("#lastScan").textContent=state.lastScan;
    qs("#scanCount").textContent=state.scanCount;
    toast("Smart scan complete — 15.6 GB potential recovery identified.");
  },2800);
}
async function checkForUpdates(manual=false){
  const box=qs("#updateStatus");
  box.innerHTML = "Checking for updates…";
  try{
    const res = await fetch(UPDATE_URL + "?t=" + Date.now(), {cache:"no-store"});
    if(!res.ok) throw new Error("Version file not available");
    const data=await res.json();
    const latest=data.latest || APP_VERSION;
    if(latest !== APP_VERSION){
      box.innerHTML = `<strong>Update available: v${latest}</strong><br><span class="muted">${data.message||"A newer Lumero prototype is available."}</span>`;
      toast("Update available: Lumero v" + latest);
    }else{
      box.innerHTML = `<strong>Lumero is up to date</strong><br><span class="muted">Current version: v${APP_VERSION}</span>`;
      if(manual) toast("Lumero is up to date.");
    }
    localStorage.setItem("lumero_last_update_check", new Date().toISOString());
  }catch(e){
    box.innerHTML = `<strong>Update check unavailable</strong><br><span class="muted">When hosted on GitHub Pages this checks <code>version.json</code>. Current version: v${APP_VERSION}</span>`;
    if(manual) toast("Could not check updates.");
  }
}
function analyseFiles(files){
  const out=qs("#photoResults");
  if(!files.length){return}
  let total=0; let rows=[];
  [...files].forEach((f,idx)=>{
    total += f.size;
    const score = Math.max(45, Math.min(98, Math.round(98 - (f.size/1024/1024)%38 - (idx%4)*6)));
    const status = score>78 ? "Best candidate" : score>62 ? "Review" : "Possibly blurred";
    rows.push(`<div class="report-row"><div><strong>${f.name}</strong><br><span class="muted">${(f.size/1024/1024).toFixed(1)} MB · ${status}</span></div><div class="circle-small">${score}</div></div>`);
  });
  out.innerHTML = `<div class="card full"><div class="kicker">Local test analysis</div><div class="big">${files.length}</div><p class="muted">files checked · ${(total/1024/1024).toFixed(1)} MB total. This is browser-side only and does not upload images.</p>${rows.join("")}</div>`;
  toast("Photo test complete — best-shot scores generated.");
}
function initUpload(){
  const input=qs("#photoInput"); if(input) input.addEventListener("change", e=>analyseFiles(e.target.files));
}
function init(){
  initTabs(); initUpload();
  qs("#lastScan").textContent=state.lastScan; qs("#scanCount").textContent=state.scanCount;
  qsa(".runScan").forEach(b=>b.addEventListener("click",runScan));
  qs("#checkUpdate").addEventListener("click",()=>checkForUpdates(true));
  const last=localStorage.getItem("lumero_last_update_check");
  if(!last || (Date.now()-new Date(last).getTime())>86400000){ checkForUpdates(false); }
  if("serviceWorker" in navigator){ navigator.serviceWorker.register("./sw.js").catch(()=>{}); }
}
document.addEventListener("DOMContentLoaded",init);
