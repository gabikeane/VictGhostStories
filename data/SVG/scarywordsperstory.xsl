<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2000/svg"
    version="2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all">
    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="barWidth" select="20" as="xs:integer"/>
    <xsl:variable name="barInterval" select="$barWidth" as="xs:double"/>
    <xsl:variable name="barShift" select="235" as="xs:integer"/>


    <xsl:template match="/">
        <svg height="500">
            <link rel="stylesheet" type="text/css" href="local.css"/>
            <g transform="translate(30, 330)">
                <line x1="20" x2="20" y1="0" y2="-250" stroke="black" stroke-width="1"/>
                <line x1="20" x2="1550" y1="0" y2="0" stroke="black" stroke-width="1"/>
                <line x1="20" x2="1550" y1="-100" y2="-100" stroke="black" opacity="0.5"
                    stroke-dasharray="8 4" stroke-width="1"/>
                <line x1="20" x2="1550" y1="-200" y2="-200" stroke="black" opacity="0.5"
                    stroke-dasharray="8 4" stroke-width="1"/>
                <text x="10" y="5" text-anchor="end">0</text>
                <text x="10" y="-200" text-anchor="end">200</text>
                <text x="10" y="-100" text-anchor="end">100</text>
                <text x="5" y="-125" text-anchor="middle">Number of Words</text>
                <text x="580" y="30" text-anchor="middle">Scariness Scale</text>
                
                <xsl:apply-templates select="//counts" mode="key"/>
                <xsl:apply-templates select="//counts" mode="one"/>
                <xsl:apply-templates select="//counts" mode="two"/>
                <xsl:apply-templates select="//counts" mode="three"/>
                <xsl:apply-templates select="//counts" mode="zero"/>
                <xsl:apply-templates select="//counts" mode="i"/>

            </g>
        </svg>
    </xsl:template>
    <xsl:template match="story" mode="key">
        <xsl:variable name="numPos" select="position() - 1" as="xs:integer"/>
        <xsl:variable name="yPosition" select="$numPos * 15"  as="xs:double"/>
        <xsl:variable name="title" select="translate(translate(normalize-space(translate(title, '''', '')), ' ', ''), '-', '')"/>
        <rect x="960" y="{$yPosition}" stroke="black" fill="pink" height="10" width="10" class="{$title}"/>
        <text x="975" y="{$yPosition + 10}" stroke="black"><xsl:value-of select="title"/></text>   
    </xsl:template>
    <xsl:template match="story" mode="one">
        <xsl:variable name="numPos" select="position() - 1" as="xs:integer"/>
        <xsl:variable name="xPosition" select="$numPos * $barInterval" as="xs:double"/>
        <xsl:variable name="yPosition" select="$numPos * 15"  as="xs:double"/>
        <xsl:variable name="wordcountone" select="num[@scale = '1']" as="xs:integer"/>
        <xsl:variable name="title" select="translate(translate(normalize-space(translate(title, '''', '')), ' ', ''), '-', '')"/>
        <rect x="{$xPosition}" y="-{$wordcountone}" stroke="black" stroke-width=".5"
            fill="blue" width="{$barWidth}" height="{$wordcountone}" class="{$title}"/>
        <text x="{$xPosition}" y="{-$wordcountone}"><xsl:value-of select="num[@scale='1']"/></text>
        <text x="100" y="15" text-anchor="middle">1</text>
        
 </xsl:template>
    <xsl:template match="story" mode="two">
        <xsl:variable name="numPos" select="position() - 1" as="xs:integer"/>
        <xsl:variable name="xPosition" select="$numPos * $barInterval" as="xs:double"/>
        <xsl:variable name="wordcounttwo" select="num[@scale = '2']" as="xs:integer"/>
        <xsl:variable name="title" select="translate(translate(normalize-space(translate(title, '''', '')), ' ', ''), '-', '')"/>
        <rect x="{$xPosition +$barShift}" y="-{$wordcounttwo}" stroke="black" stroke-width=".5"
            fill="red" width="{$barWidth}" height="{$wordcounttwo}" class="{$title}"/>
        <text x="{$xPosition +$barShift}" y="{-$wordcounttwo}"><xsl:value-of select="num[@scale='2']"/></text>
        <text x="{100 + $barShift}" y="15" text-anchor="middle">2</text>
    </xsl:template>
    <xsl:template match="story" mode="three">
        <xsl:variable name="numPos" select="position() - 1" as="xs:integer"/>
        <xsl:variable name="xPosition" select="$numPos * $barInterval" as="xs:double"/>
        <xsl:variable name="wordcountthree" select="num[@scale = '3']" as="xs:integer"/>
        <xsl:variable name="title" select="translate(translate(normalize-space(translate(title, '''', '')), ' ', ''), '-', '')"/>
        <rect x="{$xPosition + 2*$barShift}" y="-{$wordcountthree}" stroke="black" stroke-width=".5"
            fill="orange" width="{$barWidth}" height="{$wordcountthree}" class="{$title}"/>
        <text x="{$xPosition + 2*$barShift}" y="{-$wordcountthree}"><xsl:value-of select="num[@scale='3']"/></text>
        <text x="{100 + 2*$barShift}" y="15" text-anchor="middle">3</text>
    </xsl:template>
   
    <xsl:template match="story" mode="zero">
        <xsl:variable name="numPos" select="position() - 1" as="xs:integer"/>
        <xsl:variable name="xPosition" select="$numPos * $barInterval" as="xs:double"/>
        <xsl:variable name="wordcountzero" select="num[@scale = '0']" as="xs:integer"/>
        <xsl:variable name="title" select="translate(translate(normalize-space(translate(title, '''', '')), ' ', ''), '-', '')"/>
        <rect x="{$xPosition + 3*$barShift}" y="-{$wordcountzero}" stroke="black" stroke-width=".5"
            fill="green" width="{$barWidth}" height="{$wordcountzero}" class="{$title}"/>
        <text x="{$xPosition + 3*$barShift}" y="{-$wordcountzero}"><xsl:value-of select="num[@scale='0']"/></text>
        <text x="{100 + 3*$barShift}" y="15" text-anchor="middle">0</text>
    </xsl:template>

    <xsl:template match="story" mode="i">
        <xsl:variable name="numPos" select="position() - 1" as="xs:integer"/>
        <xsl:variable name="xPosition" select="$numPos * $barInterval" as="xs:double"/>
        <xsl:variable name="wordcounti" select="num[@scale = 'i']" as="xs:integer"/>
        <xsl:variable name="title" select="translate(translate(normalize-space(translate(title, '''', '')), ' ', ''), '-', '')"/>
        <rect x="{$xPosition + 4*$barShift}" y="-{$wordcounti}" stroke="black" stroke-width=".5"
            fill="pink" width="{$barWidth}" height="{$wordcounti}" class="{$title}"/>
        <text x="{$xPosition + 4*$barShift}" y="{-$wordcounti}"><xsl:value-of select="num[@scale='i']"/></text>
        <text x="{100 + 4*$barShift}" y="15" text-anchor="middle">i</text>
    </xsl:template>

</xsl:stylesheet>
