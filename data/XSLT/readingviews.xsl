<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
<xsl:template match="/">
    <html>
        <head>
            <title>Story Title</title>
            <!--<link rel = "stylesheet"
                type = "text/css"
                href = "CSS LINK HERE" />-->
        </head>
        <body>
            <h1>Story Title</h1>
            <h2>Author</h2>
            <div>
        <xsl:apply-templates select="//p"/>
            </div>
        </body>
    </html>
</xsl:template>    
<xsl:template match="p">
    <p><xsl:apply-templates/></p>
</xsl:template>  
<xsl:template match="speech">
    <q><xsl:apply-templates/></q>
    
</xsl:template>    
    
    
    
    
</xsl:stylesheet>