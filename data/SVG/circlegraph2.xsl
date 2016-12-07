<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xmlns="http://www.w3.org/2000/svg">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">
            <g transform="translate(100,610)">
                <line x1="5" x2="550" y1="-5" y2="-5" stroke="black" stroke-width="1"/>
                <line x1="5" x2="550" y1="-65" y2="-65" stroke="black" stroke-width="1"/>
                <line x1="5" x2="550" y1="-125" y2="-125" stroke="black" stroke-width="1"/>
                <line x1="5" x2="550" y1="-185" y2="-185" stroke="black" stroke-width="1"/>
                <line x1="5" x2="550" y1="-245" y2="-245" stroke="black" stroke-width="1"/>
                <line x1="5" x2="550" y1="-305" y2="-305" stroke="black" stroke-width="1"/>
                <line x1="25" y1="0" x2="25" y2="-310" stroke="black" stroke-width="1"/>
                <line x1="125" y1="0" x2="125" y2="-310" stroke="black" stroke-width="1"/>
                <line x1="225" y1="0" x2="225" y2="-310" stroke="black" stroke-width="1"/>
                <line x1="325" y1="0" x2="325" y2="-310" stroke="black" stroke-width="1"/>
                <line x1="425" y1="0" x2="425" y2="-310" stroke="black" stroke-width="1"/>
                <line x1="525" y1="0" x2="525" y2="-310" stroke="black" stroke-width="1"/>
                <xsl:apply-templates select="//story"/>
            </g>
        </svg>
    </xsl:template>
    <xsl:template match="story">
        <circle r="10" cx="30" cy="-10" fill="blue"></circle> 
    </xsl:template>   
</xsl:stylesheet>