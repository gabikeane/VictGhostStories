<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:variable name="stories" select="collection('final_markup')" as="document-node()+"/>

    <xsl:template match="/" name="nit">
        <xsl:for-each select="$stories">
            <xsl:variable name="filename"
                select="replace(tokenize(base-uri(current()), '/')[last()], 'xml', 'xhtml')"/>
            <xsl:variable name="outputfilename" select="concat('../../html/publishable_stories/', $filename)"/>
            <xsl:result-document href="{$outputfilename}" method="xml" indent="yes"
                doctype-system="about:legacy-compat">
                <html>
                    <head>
                        <title>Story Title</title>
                        <!--<link rel = "stylesheet"
                type = "text/css"
                href = "CSS LINK HERE" />-->
                    </head>
                    <body>
                        <xsl:apply-templates/>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="story">
        <h1>Story Title</h1>
        <h2>Author</h2>
        <div>
            <xsl:apply-templates select="//p"/>
        </div>
    </xsl:template>
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="speech">
        <q>
            <xsl:apply-templates/>
        </q>
    </xsl:template>
</xsl:stylesheet>
