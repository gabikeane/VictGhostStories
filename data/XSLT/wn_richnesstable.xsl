<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Exploring the Richness of the Expression of Scariness</title>
            </head>
            <body>
                <h1>Vocabulary richness</h1>
                <table>
                    <tr>
                        <td align="center"><b>Story title</b></td>
                        <td align="center"><b>Ratio</b></td>
                    </tr>
                    <xsl:apply-templates select="//story_ratios/ghost_story"></xsl:apply-templates>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="story_ratios/ghost_story">
        <tr>
            <td><xsl:value-of select="@title"></xsl:value-of></td>
            <td><xsl:value-of select="@scariness_ratio"></xsl:value-of></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>