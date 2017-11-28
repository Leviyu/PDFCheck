
# PDFCheck
This is a tool to make pdf file with checkboxes. It is originally designed for the purpose of checking seismic data. See example below:
<div align="center">
  <img src="https://github.com/Leviyu/PDFCheck/blob/master/WORKDIR/example.png"><br><br>
</div>

## 

# Usages
`c00.make_pdf.sh` is a shell script that makes the example pdf above, with several example inside.
`c01.grab_check_box_information_from_pdf.sh` is a script to show how to grab checkbox information from pdf files.

* Notes
- checkboxes would only be available when pdf file is opened and saved
- each checkbox corresponding to a unique text flag, please make sure each checkbox has a unique flag


## box1 & box2
Each of the two checkbox corresponding to a individual flag `box1` and `box2`, box1 is checked and box2 is not checked.
After changes are made to the checkboxes, checked boxes could be grabbed by pdftk using:
``` shell
pdtk ${pdf_file} dump_data_fields |grep Value
```

## check_box_with_value
This is an example to show that the checkbox can contain value or text in it.

## click_me_to_direct_to_hello_pdf
This is an example to show how to direct to another pdf file. In the example, the hyper link in the pdf would direct to `./WORKDIR/hello.pdf`

## click_me_to_direct_to_google
This is an example to show how to direct to a URL link from pdf file. In the example, the hyper link in the pdf would direct to [Google](https://google.com)


## An advanced example 
<div align="center">
  <img src="https://github.com/Leviyu/PDFCheck/blob/master/WORKDIR/advanced_example.png"><br><br>
</div>




# Additional Information
Advanced usage are all compiled in [pdfmark reference manual](http://www.adobe.com/content/dam/acom/en/devnet/acrobat/pdfs/pdfmarkreference.pdf) by Adobe Acrobat.

