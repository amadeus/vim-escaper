function! <SID>Escape(...) range
  if !&modifiable
    echomsg 'Error: Escaper Cannot modify current file.'
    return
  endif

  if exists("g:CustomEntities")
    call <SID>EntityReplace(g:CustomEntities, a:firstline . "," . a:lastline, a:000)
  endif
  call <SID>EntityReplace(s:EntityList, a:firstline . "," . a:lastline, a:000)
endfunc

function! <SID>EntityReplace(list, rng, ignore)
  for l:item in a:list
    if index(a:ignore, l:item[0]) == -1
      execute "silent " . a:rng . "s/" . l:item[0] . "/" . l:item[1] . "/eg"
    endif
  endfor
endfunc

let s:EntityList = [
  \ ['\"', '\&quot;'],
  \ ["'",  '\&apos;'],
  \ ['<',  '\&lt;'],
  \ ['>',  '\&gt;'],
  \ ['¡',  '\&iexcl;'],
  \ ['¢',  '\&cent;'],
  \ ['£',  '\&pound;'],
  \ ['¤',  '\&curren;'],
  \ ['¥',  '\&yen;'],
  \ ['¦',  '\&brvbar;'],
  \ ['§',  '\&sect;'],
  \ ['¨',  '\&uml;'],
  \ ['©',  '\&copy;'],
  \ ['ª',  '\&ordf;'],
  \ ['«',  '\&laquo;'],
  \ ['¬',  '\&not;'],
  \ ['®',  '\&reg;'],
  \ ["¯",  '\&macr;'],
  \ ['°',  '\&deg;'],
  \ ['±',  '\&plusmn;'],
  \ ['²',  '\&sup2;'],
  \ ['³',  '\&sup3;'],
  \ ['´',  '\&acute;'],
  \ ['µ',  '\&micro;'],
  \ ['¶',  '\&para;'],
  \ ['·',  '\&middot;'],
  \ ['¸',  '\&cedil;'],
  \ ['¹',  '\&sup1;'],
  \ ['º',  '\&ordm;'],
  \ ['»',  '\&raquo;'],
  \ ['¼',  '\&frac14;'],
  \ ['½',  '\&frac12;'],
  \ ['¾',  '\&frac34;'],
  \ ['¿',  '\&iquest;'],
  \ ['×',  '\&times;'],
  \ ['÷',  '\&divide;'],
  \ ['À',  '\&Agrave;'],
  \ ['Á',  '\&Aacute;'],
  \ ['Â',  '\&Acirc;'],
  \ ['Ã',  '\&Atilde;'],
  \ ['Ä',  '\&Auml;'],
  \ ['Å',  '\&Aring;'],
  \ ['Æ',  '\&AElig;'],
  \ ['Ç',  '\&Ccedil;'],
  \ ['È',  '\&Egrave;'],
  \ ['É',  '\&Eacute;'],
  \ ['Ê',  '\&Ecirc;'],
  \ ['Ë',  '\&Euml;'],
  \ ['Ì',  '\&Igrave;'],
  \ ['Í',  '\&Iacute;'],
  \ ['Î',  '\&Icirc;'],
  \ ['Ï',  '\&Iuml;'],
  \ ['Ð',  '\&ETH;'],
  \ ['Ñ',  '\&Ntilde;'],
  \ ['Ò',  '\&Ograve;'],
  \ ['Ó',  '\&Oacute;'],
  \ ['Ô',  '\&Ocirc;'],
  \ ['Õ',  '\&Otilde;'],
  \ ['Ö',  '\&Ouml;'],
  \ ['Ø',  '\&Oslash;'],
  \ ['Ù',  '\&Ugrave;'],
  \ ['Ú',  '\&Uacute;'],
  \ ['Û',  '\&Ucirc;'],
  \ ['Ü',  '\&Uuml;'],
  \ ['Ý',  '\&Yacute;'],
  \ ['Þ',  '\&THORN;'],
  \ ['ß',  '\&szlig;'],
  \ ['à',  '\&agrave;'],
  \ ['á',  '\&aacute;'],
  \ ['â',  '\&acirc;'],
  \ ['ã',  '\&atilde;'],
  \ ['ä',  '\&auml;'],
  \ ['å',  '\&aring;'],
  \ ['æ',  '\&aelig;'],
  \ ['ç',  '\&ccedil;'],
  \ ['è',  '\&egrave;'],
  \ ['é',  '\&eacute;'],
  \ ['ê',  '\&ecirc;'],
  \ ['ë',  '\&euml;'],
  \ ['ì',  '\&igrave;'],
  \ ['í',  '\&iacute;'],
  \ ['î',  '\&icirc;'],
  \ ['ï',  '\&iuml;'],
  \ ['ð',  '\&eth;'],
  \ ['ñ',  '\&ntilde;'],
  \ ['ò',  '\&ograve;'],
  \ ['ó',  '\&oacute;'],
  \ ['ô',  '\&ocirc;'],
  \ ['õ',  '\&otilde;'],
  \ ['ö',  '\&ouml;'],
  \ ['ø',  '\&oslash;'],
  \ ['ù',  '\&ugrave;'],
  \ ['ú',  '\&uacute;'],
  \ ['û',  '\&ucirc;'],
  \ ['ü',  '\&uuml;'],
  \ ['ý',  '\&yacute;'],
  \ ['þ',  '\&thorn;'],
  \ ['ÿ',  '\&yuml;'],
  \ ['∀',  '\&forall;'],
  \ ['∂',  '\&part;'],
  \ ['∃',  '\&exist;'],
  \ ['∅',  '\&empty;'],
  \ ['∇',  '\&nabla;'],
  \ ['∈',  '\&isin;'],
  \ ['∉',  '\&notin;'],
  \ ['∋',  '\&ni;'],
  \ ['∏',  '\&prod;'],
  \ ['∑',  '\&sum;'],
  \ ['−',  '\&minus;'],
  \ ['∗',  '\&lowast;'],
  \ ['√',  '\&radic;'],
  \ ['∝',  '\&prop;'],
  \ ['∞',  '\&infin;'],
  \ ['∠',  '\&ang;'],
  \ ['∧',  '\&and;'],
  \ ['∨',  '\&or;'],
  \ ['∩',  '\&cap;'],
  \ ['∪',  '\&cup;'],
  \ ['∫',  '\&int;'],
  \ ['∴',  '\&there4;'],
  \ ['∼',  '\&sim;'],
  \ ['≅',  '\&cong;'],
  \ ['≈',  '\&asymp;'],
  \ ['≠',  '\&ne;'],
  \ ['≡',  '\&equiv;'],
  \ ['≤',  '\&le;'],
  \ ['≥',  '\&ge;'],
  \ ['⊂',  '\&sub;'],
  \ ['⊃',  '\&sup;'],
  \ ['⊄',  '\&nsub;'],
  \ ['⊆',  '\&sube;'],
  \ ['⊇',  '\&supe;'],
  \ ['⊕',  '\&oplus;'],
  \ ['⊗',  '\&otimes;'],
  \ ['⊥',  '\&perp;'],
  \ ['⋅',  '\&sdot;'],
  \ ['Α',  '\&Alpha;'],
  \ ['Β',  '\&Beta;'],
  \ ['Γ',  '\&Gamma;'],
  \ ['Δ',  '\&Delta;'],
  \ ['Ε',  '\&Epsilon;'],
  \ ['Ζ',  '\&Zeta;'],
  \ ['Η',  '\&Eta;'],
  \ ['Θ',  '\&Theta;'],
  \ ['Ι',  '\&Iota;'],
  \ ['Κ',  '\&Kappa;'],
  \ ['Λ',  '\&Lambda;'],
  \ ['Μ',  '\&Mu;'],
  \ ['Ν',  '\&Nu;'],
  \ ['Ξ',  '\&Xi;'],
  \ ['Ο',  '\&Omicron;'],
  \ ['Π',  '\&Pi;'],
  \ ['Ρ',  '\&Rho;'],
  \ ['Σ',  '\&Sigma;'],
  \ ['Τ',  '\&Tau;'],
  \ ['Υ',  '\&Upsilon;'],
  \ ['Φ',  '\&Phi;'],
  \ ['Χ',  '\&Chi;'],
  \ ['Ψ',  '\&Psi;'],
  \ ['Ω',  '\&Omega;'],
  \ ['α',  '\&alpha;'],
  \ ['β',  '\&beta;'],
  \ ['γ',  '\&gamma;'],
  \ ['δ',  '\&delta;'],
  \ ['ε',  '\&epsilon;'],
  \ ['ζ',  '\&zeta;'],
  \ ['η',  '\&eta;'],
  \ ['θ',  '\&theta;'],
  \ ['ι',  '\&iota;'],
  \ ['κ',  '\&kappa;'],
  \ ['λ',  '\&lambda;'],
  \ ['μ',  '\&mu;'],
  \ ['ν',  '\&nu;'],
  \ ['ξ',  '\&xi;'],
  \ ['ο',  '\&omicron;'],
  \ ['π',  '\&pi;'],
  \ ['ρ',  '\&rho;'],
  \ ['ς',  '\&sigmaf;'],
  \ ['σ',  '\&sigma;'],
  \ ['τ',  '\&tau;'],
  \ ['υ',  '\&upsilon;'],
  \ ['φ',  '\&phi;'],
  \ ['χ',  '\&chi;'],
  \ ['ψ',  '\&psi;'],
  \ ['ω',  '\&omega;'],
  \ ['ϑ',  '\&thetasym;'],
  \ ['ϒ',  '\&upsih;'],
  \ ['ϖ',  '\&piv;'],
  \ ['Œ',  '\&OElig;'],
  \ ['œ',  '\&oelig;'],
  \ ['Š',  '\&Scaron;'],
  \ ['š',  '\&scaron;'],
  \ ['Ÿ',  '\&Yuml;'],
  \ ['ƒ',  '\&fnof;'],
  \ ['ˆ',  '\&circ;'],
  \ ['˜',  '\&tilde;'],
  \ ['–',  '\&ndash;'],
  \ ['—',  '\&mdash;'],
  \ ['‘',  '\&lsquo;'],
  \ ['’',  '\&rsquo;'],
  \ ['‚',  '\&sbquo;'],
  \ ['“',  '\&ldquo;'],
  \ ['”',  '\&rdquo;'],
  \ ['„',  '\&bdquo;'],
  \ ['†',  '\&dagger;'],
  \ ['‡',  '\&Dagger;'],
  \ ['•',  '\&bull;'],
  \ ['…',  '\&hellip;'],
  \ ['‰',  '\&permil;'],
  \ ['′',  '\&prime;'],
  \ ['″',  '\&Prime;'],
  \ ['‹',  '\&lsaquo;'],
  \ ['›',  '\&rsaquo;'],
  \ ['‾',  '\&oline;'],
  \ ['€',  '\&euro;'],
  \ ['™',  '\&trade;'],
  \ ['←',  '\&larr;'],
  \ ['↑',  '\&uarr;'],
  \ ['→',  '\&rarr;'],
  \ ['↓',  '\&darr;'],
  \ ['↔',  '\&harr;'],
  \ ['↵',  '\&crarr;'],
  \ ['⌈', '\&lceil;'],
  \ ['⌉', '\&rceil;'],
  \ ['⌊', '\&lfloor;'],
  \ ['⌋', '\&rfloor;'],
  \ ['◊',  '\&loz;'],
  \ ['♠',  '\&spades;'],
  \ ['♣',  '\&clubs;'],
  \ ['♥',  '\&hearts;'],
  \ ['♦',  '\&diams;'],
  \ ['\(&\)\([0-9A-Za-z]\{1,8};\)\@!', '\&amp;']
\ ]

" External API commands
command! -nargs=* -range=% Escape    <line1>,<line2>call <SID>Escape("<", ">", "\"", "\'", <f-args>)
command! -nargs=* -range=% EscapeAll <line1>,<line2>call <SID>Escape(<f-args>)