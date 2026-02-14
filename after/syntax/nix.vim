" Keep Nix punctuation green outside string interpolation.
" Interpolation delimiters use nixInterpolationDelimiter from the colorscheme.
syntax match nixPoppingAndLockingPunctuation /[{}()=;]/ containedin=ALLBUT,nixInterpolation,nixSimpleString,nixString
highlight default link nixPoppingAndLockingPunctuation Delimiter
