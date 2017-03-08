<?xml version="1.0" encoding="UTF-8"?><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:variable name="stories" select="collection('final_markup')" as="document-node()+"/>

    <xsl:template match="/" name="init">
        <xsl:for-each select="$stories">
            <xsl:variable name="filename"
                select="replace(tokenize(base-uri(current()), '/')[last()], 'xml', 'xhtml')"/>
            <xsl:variable name="outputfilename"
                select="concat('../../html/publishable_stories/', $filename)"/>
            <xsl:result-document href="{$outputfilename}" method="xml" indent="yes">
                <html xmlns="http://www.w3.org/1999/xhtml">
                    <head>
                        <title>
                            <xsl:apply-templates select="//title"/>
                        </title>
                        <link rel="stylesheet" type="text/css" href="../css/VGSplash.css"/>
                    </head>
                    <body>
                        <div>
                            <h1>
                                <xsl:apply-templates select="//title"/>
                            </h1>
                            <h2>
                                <xsl:apply-templates select="//author"/>
                            </h2>
                        </div>
                        <xsl:apply-templates/>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="story">
        <div class="w3-container">
            <xsl:apply-templates select="//body"/>
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
    <xsl:template match="chapTitle">
        <h3>
            <xsl:apply-templates/>
        </h3>
    </xsl:template>
</xsl:stylesheet>
