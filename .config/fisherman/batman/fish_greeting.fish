function fst; set_color -o fa0; end
function snd; set_color -o 36f; end
function trd; set_color -o f06; end
function dim; set_color    666; end
function off; set_color normal; end

function fish_greeting
  echo (dim)(uname -mnprs)(off)
end