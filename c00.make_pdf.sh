#!/bin/tcsh


set PWD = `pwd`
set OUT = $PWD/WORKDIR/test.ps
set OUT_pdf = $PWD/test.pdf
set pdfmark_header = $PWD/pdfmark_sup/header.data





cat /dev/null >! $OUT
psxy -JX6i/1i -R0/10/0/10 -Y9i  -K -P  << EOF>! $OUT
EOF

# read in pdfmark header
cat $pdfmark_header >> $OUT


set box_size = 500
set x_beg = 0
set x_end = `echo "$x_beg + $box_size"|bc`
set y_beg = 0
set y_end = `echo "$y_beg + $box_size"|bc`


# ================================
# 			Box 1
set flag_text = box1
pstext -Y-1i -JX -R -O -K -N << EOF >>$OUT
0 5 15 0 0 LB $flag_text
EOF

cat << EOF >> $OUT
[ 
	/T ( ${flag_text} )
	/V /${flag_text} 							% with this line, box is checked, otherwise not checked
	/FT /Btn
	/Rect [$x_beg $y_beg $x_end $y_end] 		% — position
	/F 4 /H /O
	/BS << /W 1 /S /S >>
	/MK << /CA (8) /BC [ 0 ] /BG [ 2 ] >>  		% Colors
	/DA (/ZaDb 0 Tf 1 0 0 rg) 					% — size and colors
	/AP << /N << /${flag_text} /null >> >> 		% — checkbox value
	/Subtype /Widget
	/ANN pdfmark
EOF




# =========================
# 	Box 2
psxy -JX -R -O -K -Y-1i << EOF >> $OUT
EOF
set flag_text = box2
pstext -Y-1i -JX -R -O -K -N << EOF >>$OUT
0 5 15 0 0 LB $flag_text
EOF

cat << EOF >> $OUT
[ 
	/T ( ${flag_text} )
	% /V /${flag_text} 							% with this line, box is checked, otherwise not checked
	/FT /Btn
	/Rect [$x_beg $y_beg $x_end $y_end] 		% — position
	/F 4 /H /O
	/BS << /W 1 /S /S >>
	/MK << /CA (8) /BC [ 0 ] /BG [ 2 ] >>  		% Colors
	/DA (/ZaDb 0 Tf 1 0 0 rg) 					% — size and colors
	/AP << /N << /${flag_text} /null >> >> 		% — checkbox value
	/Subtype /Widget
	/ANN pdfmark
EOF




# ========================
# 		Pdf link
psxy -JX -R -O -K -Y-1i << EOF >> $OUT
EOF
set flag_text = click_me_to_direct_to_hello_pdf
set pdf_file = ./WORKDIR/hello.pdf
pstext -Y-1i -JX -R -O -K -N << EOF >>$OUT
0 5 15 0 0 LB $flag_text
EOF

cat << EOF >> $OUT
[ 
	/T ( ${flag_text} )
	% /V /${flag_text} 							% with this line, box is checked, otherwise not checked
	/FT /Btn
	/Rect [$x_beg $y_beg $x_end $y_end] 		% — position
	/F 4 /H /O
	/BS << /W 1 /S /S >>
	/MK << /CA (8) /BC [ 0 ] /BG [ 2 ] >>  		% Colors
	/DA (/ZaDb 0 Tf 1 0 0 rg) 					% — size and colors
	/AP << /N << /${flag_text} /null >> >> 		% — checkbox value
	/Subtype /Widget
	/ANN pdfmark
[ /Rect [$x_beg $y_beg $x_end $y_end] 
	/Action /Launch 
	/Border [0 0 2]
	/Color [1 0 0]
	/File ($pdf_file) 
	/Subtype /Link
	/ANN pdfmark
EOF



# ========================
# 		URL link
psxy -JX -R -O -K -Y-1i << EOF >> $OUT
EOF
set flag_text = click_me_to_direct_to_google
set URI = "www.google.com"
pstext -Y-1i -JX -R -O -K -N << EOF >>$OUT
0 5 15 0 0 LB $flag_text
EOF

cat << EOF >> $OUT
[ 
	/T ( ${flag_text} )
	% /V /${flag_text} 							% with this line, box is checked, otherwise not checked
	/FT /Btn
	/Rect [$x_beg $y_beg $x_end $y_end] 		% — position
	/F 4 /H /O
	/BS << /W 1 /S /S >>
	/MK << /CA (8) /BC [ 0 ] /BG [ 2 ] >>  		% Colors
	/DA (/ZaDb 0 Tf 1 0 0 rg) 					% — size and colors
	/AP << /N << /${flag_text} /null >> >> 		% — checkbox value
	/Subtype /Widget
	/ANN pdfmark
[ /Rect [$x_beg $y_beg $x_end $y_end] 
	/Action /Launch 
	/Border [0 0 2]
	/Color [1 0 0]
	/URI ($URI) 
	/Subtype /Link
	/ANN pdfmark
EOF



psxy -JX -R -O << EOF>>$OUT
EOF


ps2pdf $OUT $OUT_pdf
/bin/rm $OUT
