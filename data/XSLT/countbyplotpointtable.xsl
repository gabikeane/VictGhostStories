<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml" version="2.0">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:template match="data">
        <html>
            <head><link rel="stylesheet" type="text/css" href="local.css"/></head>
            <body>
                <table>
                    <tr>
                        <td/>
                        <td>Introduction</td>
                        <td>Protagonist</td>
                        <td>Haunting</td>
                        <td>History</td>
                        <td>Resolve</td>
                    </tr>
                    <xsl:apply-templates/>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="root">
    <xsl:variable name="plotpoint" select="plot/@point"/>    
        
        <tr>
            <td><xsl:apply-templates select="@title"/></td>
            <td>
                <xsl:apply-templates select="plot[@point = 'protag']"/>
            </td>
            <td>
                <xsl:apply-templates select="plot[@point = 'intro']"/>
            </td>
            <td>
                <xsl:apply-templates select="plot[@point = 'history']"/>
            </td>
            <td>
                <xsl:apply-templates select="plot[@point = 'haunting']"/>
            </td>
            <td>
                <xsl:apply-templates select="plot[@point = 'resolve']"/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
