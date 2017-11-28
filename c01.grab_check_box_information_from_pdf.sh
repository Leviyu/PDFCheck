#!/bin/tcsh
# This script grabs checkbox information from pdf file use pdftk
# 




set PWD = `pwd`

set pdf_file = $PWD/test.pdf



pdftk $pdf_file dump_data_fields |grep Value

