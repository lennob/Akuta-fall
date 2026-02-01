$text = Get-Content index.html -Raw
$start = $text.IndexOf("      mediaViewer.innerHTML = `")
$end = $text.IndexOf("      document.body.append(mediaViewer);", $start)
if ($start -lt 0 -or $end -lt 0) { throw 'markers' }
$newBlock = "      mediaViewer.innerHTML = `\n        <div class=\"media-panel\">\n          <div class=\"media-header\">\n            <span id=\"mediaTitle\">Visa studenten</span>\n            <button type=\"button\" class=\"btn-icon media-close\" id=\"mediaCloseBtn\" aria-label=\"Stäng\">\n              <svg width=\"18\" height=\"18\" viewBox=\"0 0 18 18\" aria-hidden=\"true\">\n                <line x1=\"4\" y1=\"4\" x2=\"14\" y2=\"14\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\"/>\n                <line x1=\"14\" y1=\"4\" x2=\"4\" y2=\"14\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\"/>\n              </svg>\n            </button>\n          </div>\n          <div class=\"media-body\" id=\"mediaBody\"></div>\n        </div>\n      `"
$text = $text.Substring(0, $start) + $newBlock + $text.Substring($end)
Set-Content index.html -Value $text
