const fs=require('fs');
const path='index.html';
let text=fs.readFileSync(path,'utf8');
const old='      <nav class="card step-nav" aria-label="Steg">\r\n        <div class="step-nav-row">\r\n          <ol class="steps" id="stepsList"></ol>\r\n          <a class="btn-secondary step-nav-link" href="./compendium.html">Kompendium</a>\r\n        </div>\r\n      </nav>';
const neu='      <nav class="card step-nav" aria-label="Steg">\r\n        <div class="step-nav-row">\r\n          <div class="steps" id="stepsList"></div>\r\n        </div>\r\n      </nav>';
if(!text.includes(old)) {
  throw new Error('old not found');
}
text=text.replace(old,neu);
fs.writeFileSync(path,text,'utf8');
