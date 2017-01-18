<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2000/svg"
    version="2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        <svg height="375">
            <g transform="translate(30, 330)">
                <line x1="30" x2="30" y1="0" y2="-300" stroke="black" stroke-width="1"/>
                <line x1="30" x2="{5 * 50 + 50}" y1="0" y2="0" stroke="black" stroke-width="1"/>
                <text x="25" y="5" text-anchor="end">0</text>
                <text x="25" y="-145" text-anchor="end">25</text>
                <text x="25" y="-290" text-anchor="end">50</text>
                <text x="165" y="40" text-anchor="middle">Part of Speech</text>
                <text x="10" y="-145" transform="rotate(270, 2, -145)" text-anchor="middle">Number
                    of 3-Rated Scary Words</text>
                <xsl:apply-templates select="/story"/>
            </g>
        </svg>
    </xsl:template>
    <xsl:template match="story">
        <text x="165" y="-305" text-anchor="middle">
            <xsl:value-of select="//meta/title"/>
        </text>
        <xsl:variable name="xPosition" select="(position() - 1) * 30"/>
        <xsl:variable name="noun" select="count(//scary_word[@pos = 'noun' and @scale = '3'])"/>
        <xsl:variable name="adjective" select="count(//scary_word[@pos = 'adj' and @scale = '3'])"/>
        <xsl:variable name="verb" select="count(//scary_word[@pos = 'verb' and @scale = '3'])"/>
        <xsl:variable name="adverb" select="count(//scary_word[@pos = 'adv' and @scale = '3'])"/>
        <xsl:variable name="intensifier" select="count(//scary_word[@pos = 'i' and @scale = '3'])"/>
        <rect x="{$xPosition + 50}" y="-{$noun * 6}" stroke="black" stroke-width=".5" fill="blue"
            width="30" height="{$noun * 6}"/>
        <text x="{$xPosition + 65}" y="-{$noun * 6 + 3}" text-anchor="middle">
            <xsl:value-of select="string($noun)"/>
        </text>
        <text x="{$xPosition + 30 div 2 + 50}" y="20" text-anchor="middle">
            <xsl:text>noun</xsl:text>
        </text>

        <rect x="{$xPosition + 100}" y="-{$adjective * 6}" stroke="black" stroke-width=".5"
            fill="red" width="30" height="{$adjective * 6}"/>
        <text x="{$xPosition + 115}" y="-{$adjective * 6 + 3}" text-anchor="middle">
            <xsl:value-of select="string($adjective)"/>
        </text>
        <text x="{$xPosition + 30 div 2 + 100}" y="20" text-anchor="middle">
            <xsl:text>adj</xsl:text>
        </text>

        <rect x="{$xPosition + 150}" y="-{$verb * 6}" stroke="black" stroke-width=".5" fill="yellow"
            width="30" height="{$verb * 6}"/>
        <text x="{$xPosition + 165}" y="-{$verb * 6 + 3}" text-anchor="middle">
            <xsl:value-of select="string($verb)"/>
        </text>
        <text x="{$xPosition + 30 div 2 + 150}" y="20" text-anchor="middle">
            <xsl:text>verb</xsl:text>
        </text>

        <rect x="{$xPosition + 200}" y="-{$adverb * 6}" stroke="black" stroke-width=".5"
            fill="green" width="30" height="{$adverb * 6}"/>
        <text x="{$xPosition + 215}" y="-{$adverb * 6 + 3}" text-anchor="middle">
            <xsl:value-of select="string($adverb)"/>
        </text>
        <text x="{$xPosition + 30 div 2 + 200}" y="20" text-anchor="middle">
            <xsl:text>adv</xsl:text>
        </text>

        <rect x="{$xPosition + 250}" y="-{$intensifier * 6}" stroke="black" stroke-width=".5"
            fill="purple" width="30" height="{$intensifier * 6}"/>
        <text x="{$xPosition + 265}" y="-{$intensifier * 6 + 3}" text-anchor="middle">
            <xsl:value-of select="string($intensifier)"/>
        </text>
        <text x="{$xPosition + 30 div 2 + 250}" y="20" text-anchor="middle">
            <xsl:text>intens</xsl:text>
        </text>
    </xsl:template>
</xsl:stylesheet>
