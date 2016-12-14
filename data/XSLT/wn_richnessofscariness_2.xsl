<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="story">
        <xsl:copy>
            <meta>
                <scariness_ratio>
                    <xsl:value-of
                        select="count(distinct-values(//scary_word[not(@scale = '0')]/@synset)) div count(//scary_word[not(@scale = '0')]/@synset)"
                    />
                </scariness_ratio>
            </meta>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>