<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:template match="title">
        <title>
            <xsl:apply-templates/>
        </title>
    </xsl:template>
    <xsl:template match="meta | body | plot">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="*">
        <xsl:element name="{name()}">
            <xsl:attribute name="type" select="'start'"/>
            <xsl:if test="self::scary_word">
                <xsl:attribute name="scale" select="@scale"/>
                <xsl:attribute name="pos" select="@pos"/>
            </xsl:if>
        </xsl:element>
        <xsl:apply-templates/>
        <xsl:element name="{name()}">
            <xsl:attribute name="type" select="'end'"/>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>