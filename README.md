
This XSLT was tested by:

1. Running 
```msxsl.exe <appscan_standard_xml_output> <xsl_file_from_this_project> -o <output_file>.html```
2. Opening output file in IE Edge

Note that large AppScan Standard results files (multiple thousand issues) may cause the browser to hang for a few seconds.

Also note that MSXSL will output the html file encoded in UTF-16. FireFox and Chrome seem to have issues reconciling that the HTML file is UTF-16, while the imported JS and CSS are UTF-8. As a result, FireFox and Chrome are not able to successfully display the data formatted as desired. Using a tool other than MSXSL for the conversion may resolve this issue.
