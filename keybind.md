TODO: All Plugins Keybinds

-- buffers
<leader>bn -> BufferLineCyclePrev
<leader>bi -> BufferLineCycleNext
<leader>bN -> BufferLineMovePrev
<leader>bI -> BufferLineMoveNext
<leader>bcn -> delete buffers to the left
<leader>bci -> delete buffer to the right
<leader>bco -> delete other buffers
<leader>bp -> toggle pin buffer
<leader>bP -> delete Non-Pined Buffers

-- conform
<localleader>F -> format injected
<localleader>f -> format

-- flash
s -> flash search
S -> flash treesitter
r -> remote flash (o mode)
R -> treesitter search
<c-s> -> toggle flash search

-- grug-far
;sr -> search and replace

-- neo-tree
<A-1> -> explorer neotree (root dir)
<A-2> -> explorer neotree (cwd)
<A-3> -> explorer git
<A-4> -> explorer buffer

-- lsp
<leader>;cl -> lsp info
gd -> goto definition
gr -> references
gi -> goto implementation
gt -> goto type definition
gD -> goto declaration
<leader>h -> hover
gh -> signature help
<c-;> -> signature help (insert mode)
<leader>ca -> code action
<leader>cc -> run codelens
<leader>cC -> refresh & display codelens
<leader>cR -> rename file
<leader>cr -> rename
<leader>cA -> source action
]] -> next references
[[ -> prev references

# NVIM-NOTIFY

| MODE | KEY                         | ROLE                      |
| ---- | --------------------------- | ------------------------- |
| n    | <localleader><localleader>z | dismiss all notifications |

# MINI.AI

| MODE | KEY | ROLE        |
| ---- | --- | ----------- |
| o    | a   | around      |
| o    | k   | inside      |
| o    | an  | around next |
| o    | kn  | inside next |
| o    | al  | around last |
| o    | kl  | around last |
| n    | g[  | goto left   |
| n    | g]  | goto right  |

Extra:
|KEY|ROLE-a|ROLE-i|
---|---|---
o|@block.outer, @conditional.outer, @loop.outer|@block.inner, @conditional.inner, @loop.inner
f|@function.outer|@function.inner
c|@class.outer|@class.inner
t|tag|tag
d|digits|digits
e|word with case|word with case
i|indent|indent
g|buffer|buffer
u|function call without dot|function call without dot
U|function call|function call

# GITSIGNS

| MODE | KEY              | ROLE                 |
| ---- | ---------------- | -------------------- |
| n    | ]h               | Next Hunk            |
| n    | [h               | Previous Hunk        |
| n    | ]H               | Last Hunk            |
| n    | [H               | First Hunk           |
| n,v  | <localleader>ghs | Stage Hunk           |
| n,v  | <localleader>ghr | Reset Hunk           |
| n    | <localleader>ghS | Stage Buffer Hunk    |
| n    | <localleader>ghu | Undo Stage Hunk      |
| n    | <localleader>ghR | Reset Buffer         |
| n    | <localleader>ghp | Preview Hunk Inline  |
| n    | <localleader>ghb | Blame Line           |
| n    | <localleader>ghB | Blame Buffer         |
| n    | <localleader>ghd | Diff This            |
| n    | <localleader>ghD | Diff This ~          |
| o,x  | <localleader>h   | GitSigns Select Hunk |

# TROUBLE

| MODE | KEY        | ROLE                                     |
| ---- | ---------- | ---------------------------------------- |
| n    | <leader>xx | Buffer Diagnostics (Trouble)             |
| n    | <leader>xX | Diagnostics (Trouble)                    |
| n    | <leader>xs | Symbols (Trouble)                        |
| n    | <leader>xS | LSP references/definitions/... (Trouble) |
| n    | <leader>xl | Localtion List (Trouble)                 |
| n    | <leader>xq | Quickfix List (Trouble)                  |
| n    | [q         | Previous Item                            |
| n    | ]q         | Next Item                                |

# TODO-COMMENTS

| MODE | KEY        | ROLE                       |
| ---- | ---------- | -------------------------- |
| n    | ]t         | Next TODO                  |
| n    | [t         | Previous TODO              |
| n    | <leader>xt | Trouble todo toggle        |
| n    | <leader>xT | Trouble todo tags toggle   |
| n    | <leader>st | Telescope todo toggle      |
| n    | <leader>sT | Telescope todo tags toggle |

# TREESITTER

| MODE | KEY       | ROLE                       |
| ---- | --------- | -------------------------- |
| x,n  | <S-Space> | Init Selection             |
| x,n  | <S-Space> | Node Incremental Selection |
| x,n  | <S-BS>    | Node Decremental Selection |
| n    | ]f        | Next function start        |
| n    | ]c        | Next class start           |
| n    | ]a        | Next parameter start       |
| n    | ]F        | Next function end          |
| n    | ]C        | Next class end             |
| n    | ]A        | Next parameter end         |
| n    | [f        | Pervious function start    |
| n    | [c        | Pervious class start       |
| n    | [a        | Pervious parameter start   |
| n    | [F        | Pervious function end      |
| n    | [C        | Pervious class end         |
| n    | [A        | Pervious parameter end     |

# NOICE

| MODE  | KEY        | ROLE                      |
| ----- | ---------- | ------------------------- |
| n     | <leader>z  | noice prefix (no role)    |
| c     | <S-Enter>  | redirect cmdline          |
| n     | <leader>zl | noice last message        |
| n     | <leader>zh | noice history             |
| n     | <leader>za | noice all message         |
| n     | <leader>zx | noice dismiss all message |
| n     | <leader>zx | noice picker              |
| i,n,s | <A-S-e>    | scroll forward            |
| i,n,s | <A-S-u>    | scroll backward           |
| c     | <M-u>      | up history                |
| c     | <M-e>      | down history              |
| c     | <M-n>      | move left                 |
| c     | <M-i>      | move right                |

# PERSISENCE

| MODE | KEY        | ROLE                       |
| ---- | ---------- | -------------------------- |
| n    | <leader>qr | restore session            |
| n    | <leader>qs | select session             |
| n    | <leader>qR | restore last session       |
| n    | <leader>qx | Don't Save Current Session |

<C-o> 上一个位置
<C-i> 下一个位置

TODO: 填写 Telescope keybinds
TODO: 填写 yanky keybinds
TODO: 填写 mini.comment keybinds
TODO: 填写 mini.surround keybinds
TODO: 填写 dial keybinds
TODO: 填写 outline keybinds
TODO: 填写 neogen keybinds
TODO: 填写 gitui keybinds
TODO: 填写 refactoring keybinds
TODO: 填写 overseer keybinds
TODO: 填写 dap keybinds

TODO: config neo-tree base keys and edgy
