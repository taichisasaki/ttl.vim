" Vim syntax file
" Language:	Tera Term Language (TTL)
" Maintainer:	Taichi Sasaki
" URL:		http://github.com/taichisasaki/ttl.vim
" Last Change:	2012 August 10

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'ttl'
endif

" Drop fold if it set but vim doesn't support it.
if version < 600 && exists("ttl_fold")
  unlet ttl_fold
endif

syn match   ttlLineComment  ";.*$"
syn region  ttlComment      start="/\*" end="\*/"

syn region  ttlStringD      start=+"+ skip=+\\\\\|\\"+ end=+"\|$+
syn region  ttlStringS      start=+'+ skip=+\\\\\|\\'+ end=+'\|$+
syn match   ttlNumber       "-\=\<\d\+\>"

syn keyword ttlIdentifier   groupmatchstr1 groupmatchstr2 groupmatchstr3
syn keyword ttlIdentifier   groupmatchstr4 groupmatchstr5 groupmatchstr6
syn keyword ttlIdentifier   groupmatchstr7 groupmatchstr8 groupmatchstr9
syn keyword ttlIdentifier   inputstr matchstr
syn keyword ttlIdentifier   param1 param2 param3 param4 param5
syn keyword ttlIdentifier   param6 param7 param8 param9 paramcnt
syn keyword ttlIdentifier   result timeout mtimeout

syn keyword ttlStatement    break call end execcmnd exit goto include mpause pause return
syn keyword ttlConditional  if then elseif else endif
syn keyword ttlRepeat       do loop for next until enduntil while endwhile 
syn match   ttlLabel        ":[a-zA-Z0-9_]\{1,32}"
syn keyword ttlOperator     and not or xor
syn match   ttlOperator     "[~!+\-\*/%&\^|<>=]\|>>\|<<\|>>>\|<=\|>=\|==\|<>\|!=\|&&\|||"

syn keyword ttlFunction     bplusrecv bplussend callmenu changedir clearscreen closett
syn keyword ttlFunction     connect cygconnect disconnect dispstr enablekeyb flushrecv
syn keyword ttlFunction     gethostname gettitle kmtfinish kmtget kmtrecv kmtsend
syn keyword ttlFunction     loadkeymap logclose loginfo logopen logpause logstart
syn keyword ttlFunction     logwrite quickvanrecv quickvansend recvln restoresetup scprecv
syn keyword ttlFunction     scpsend send sendbreak sendbroadcast sendfile sendkcode
syn keyword ttlFunction     sendln sendlnbroadcast sendmulticast setbaud setdebug setdtr
syn keyword ttlFunction     setecho setmulticastname setrts setsync settitle showtt
syn keyword ttlFunction     testlink unlink wait wait4all waitevent waitln
syn keyword ttlFunction     waitn waitrecv waitregex xmodemrecv xmodemsend ymodemrecv
syn keyword ttlFunction     ymodemsend zmodemrecv zmodemsend 

syn keyword ttlFunction     code2str expandenv int2str sprintf sprintf2 str2code
syn keyword ttlFunction     str2int strcompare strconcat strcopy strinsert strjoin
syn keyword ttlFunction     strlen strmatch strremove strreplace strscan strspecial
syn keyword ttlFunction     strsplit strtrim tolower toupper 

syn keyword ttlFunction     basename dirname fileclose fileconcat filecopy filecreate
syn keyword ttlFunction     filedelete filelock filemarkptr fileopen filereadln fileread
syn keyword ttlFunction     filerename filesearch fileseek fileseekback filestat filestrseek
syn keyword ttlFunction     filestrseek2 filetruncate fileunlock filewrite filewriteln
syn keyword ttlFunction     findfirst findnext findclose foldercreate folderdelete foldersearch
syn keyword ttlFunction     getdir getfileattr makepath setdir setfileattr 

syn keyword ttlFunction     delpassword getpassword ispassword passwordbox setpassword

syn keyword ttlFunction     beep closesbox clipb2var crc32 crc32file exec
syn keyword ttlFunction     filenamebox getdate getenv getspecialfolder gettime getttdir
syn keyword ttlFunction     getver ifdefined inputbox intdim messagebox random
syn keyword ttlFunction     rotateleft rotateright setdate setdlgpos setenv setexitcode
syn keyword ttlFunction     settime show statusbox strdim var2clipb yesnobox 

if version >= 508 || !exists("did_ttl_syntax_inits")
    if version < 508
        let did_ttl_syntax_inits = 1
        command -nargs=+ HiLink hi link <args>
    else
        command -nargs=+ HiLink hi def link <args>
    endif

    HiLink ttlLineComment   Comment
    HiLink ttlComment       Comment

    HiLink ttlStringS       String
    HiLink ttlStringD       String
    HiLink ttlNumber        Number

    HiLink ttlIdentifier    Identifier
    HiLink ttlFunction      Function

    HiLink ttlStatement     Statement
    HiLink ttlConditional   Conditional
    HiLink ttlRepeat        Repeat
    HiLink ttlLabel         Label
    HiLink ttlOperator      Operator

    delcommand HiLink
endif

let b:current_syntax = "ttl"
