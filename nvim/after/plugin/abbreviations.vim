" Abbreviations
" :h Abbreviations
" <space> --> expand abbreviation

" -----------------------------------------------------------------
" An abbreviation is only recognized when you type a non-keyword character.
" This can also be the <Esc> that ends insert mode or the <CR> that ends a
" command.  The non-keyword character which ends the abbreviation is inserted
" after the expanded abbreviation.  An exception to this is the character <C-]>,
" which is used to expand an abbreviation without inserting any extra
" characters.
" <C-]>

" -----------------------------------------------------------------
" https://vim.fandom.com/wiki/Using_abbreviations

" Use the :abbreviate command to define abbreviations.
" :ab  -- List all abbreviations
" https://github.com/yuhc/yuhc-vim/blob/master/abbreviations.vim

" https://vim.fandom.com/wiki/Category:Abbreviations

"+yg_

" iabbrev DU DSLAM uređaj<space><space>
iabbrev DU DSLAM uređaj<space><space><Esc>0j

" niti 1, 2  (LC kon)
iabbrev UKO niti 1, 2  (LC kon)<Esc>0"+yg_


" Uređajsko, Juniper modul:
iabbrev UJM Nije potrebno nabavljati optički modul za Juniper MX960 .:<CR>Već je instaliran, i ožičen na interni 10 Gbit/s optički panel (LC kon) u istom ormaru.<esc>0kVj"+y

" Uređajsko, lokacija korisnika:
iabbrev ULK Lokacija korisnika:<CR>Korisnik treba za svoj uređaj nabaviti uobičajeni 10GbE optički modul:<CR>10GBASE-LR transmitter (10 Gbps, 1310 nm, 10 km, SMF)<esc>0kkVjj"+y


" -----------------------------------------------------------------
" Mrežno, po mrežnom:
iabbrev MPM Po mrežnom TR-u se prespaja u TK sobi zgrade<esc>

" Mrežno, popis veza:
iabbrev MPV Cijeli popis veza nalazi se na kraju ovoga UR_TR-a.<esc>0"+yg_

" Mrežno, po realizaciji:
iabbrev MPR Molim pogledati wwms zabilješku po realizaciji mrežnog TR-a (realizirane niti)!<esc>0"+yg_

" Mrežno, direktne niti:
iabbrev MDN Postoje direktne niti (nema radova u mreži).<esc>0"+yg_

" -----------------------------------------------------------------
" tehničar zabilješka:
iabbrev HTZ Obavezna je wwms zabilješka radi ažuriranja u DIS-u:  niti u SVK tamponu ?:<CR>Nakon toga treba karticu poslati na ažur DIS-a (ako nisu one iz TR-a).<esc>0kVj"+y


" -----------------------------------------------------------------
iabbrev ZXJ NAPOMENA ZX SFP, Juniper:<CR>No.  ŠIFRA  KRATKI NAZIV  KOM<CR>1  40985713  SFP XGSF-1512-80D/P5 SFP-GE-ZX JN (1550 nm, 80 km, SMF, Juniper zamjenski)  2 kom<esc>0kkVjj"+y

iabbrev ZXH NAPOMENA ZX SFP, Huawei:<CR>No.  ŠIFRA  KRATKI NAZIV  KOM<CR>1  40985714  SFP XGSF-1512-80D/P5 SFP GE-ZX HW (1550 nm, 80 km, SMF, Huawei zamjenski)  2 kom<esc>0kkVjj"+y

iabbrev ZXC NAPOMENA ZX SFP, Cisco:<CR>No.  ŠIFRA  KRATKI NAZIV  KOM<CR>1  3415018469  XGSF-1512-80D/P5  SFP-GE-ZX  CS (1550 nm, 80 km, SMF, Cisco zamjenski)  1 kom<esc>0kkVjj"+y

iabbrev SMMM NAPOMENA SM/MM konverzija:<CR>No.  ŠIFRA  KRATKI NAZIV  KOM<CR>1  3415010233  Juniper SFP-1GE-SX Transceiver*  (850nm)  2 kom<CR>2  3424010484  Optical Patch Cord SC - LC 2x5m MM  2 kom<CR>3  3424011400  Op.Pat.Cord LC/PC-LC/PC 2x2m MM  2 kom<esc>0kkkkVjjjj"+y


" -----------------------------------------------------------------
iabbrev APC PRESPOJ NA FTTH SR:<CR>No.  ŠIFRA  KRATKI NAZIV  KOM<CR>1  3424010519  Optic. Patch Cord LC/UPC-LC/APC 2x20m SM  1 kom<CR>Po provjeri, naručiti prespojni kabel potrebne duljine.<esc>0kkkVjjj"+y


iabbrev c6 ------------------------------------------------------------<Esc>0Y
iabbrev c3 ------------------------------<Esc>0Y



" -----------------------------------------------------------------
" iabbrev <Left> [
" iabbrev <Right> ]



" -----------------------------------------------------------------
" The 'helpgrep' command is very useful for searching through all the files located in the .vim/doc directory.
" This allows me to type :H uganda to search for the word 'uganda' in all of the help files.
cnoreabbrev H helpgrep


" https://github.com/Happy-Dude/dotfiles
" From https://stackoverflow.com/posts/3879737/revisions
" :hs command abbreviation/ alias for :split (horizontal split)
" Provides some consistency for :vs (shorthand for :vsplit, vertical split)
cnoreabbrev <expr> hs ((getcmdtype() is# ':' && getcmdline() is# 'hs')?('split'):('hs'))




" -----------------------------------------------------------------
" cnoreabbrev W! w!
" cnoreabbrev Q! q!
" cnoreabbrev Qall! qall!
" cnoreabbrev Wq wq
" cnoreabbrev Wa wa
" cnoreabbrev wQ wq
" cnoreabbrev WQ wq
" cnoreabbrev W w
" cnoreabbrev Q q
" cnoreabbrev Qall qall

" https://vim.fandom.com/wiki/Using_abbreviations

" -----------------------------------------------------------------
" To get a C-style comment when you type 'com', you can add this to your .vimrc file:
" iab com /*<CR><space>*<CR><Left>*/<Up>

iab cl --[[<CR><ESC>

" -----------------------------------------------------------------
" Here are some useful abbreviations for Java code:

" iabbrev psvm public static void main(String[] args){<CR>}<esc>O
" iabbrev sysout System.out.println("");<esc>2hi
" iabbrev sop System.out.println("");<esc>2hi
" iabbrev syserr System.err.println("");<esc>2hi
" iabbrev sep System.err.println("");<esc>2hi
"
" iabbrev forl for (int i = 0; i < ; i++) {<esc>7hi
" iabbrev tryb try {<CR>} catch (Exception ex) {<CR> ex.printStackTrace();<CR>}<esc>hx3ko
" iabbrev const public static final int
"
" iabbrev ctm System.currentTimeMillis()
" iabbrev slept try {<CR> Thread.sleep();<CR>}<esc>hxA catch(Exception ex) {<CR> ex.printStackTrace();<CR>}<esc>hx3k$hi

" -----------------------------------------------------------------


