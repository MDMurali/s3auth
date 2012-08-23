<?xml version="1.0"?>
<!--
 * Copyright (c) 2012, s3auth.com
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met: 1) Redistributions of source code must retain the above
 * copyright notice, this list of conditions and the following
 * disclaimer. 2) Redistributions in binary form must reproduce the above
 * copyright notice, this list of conditions and the following
 * disclaimer in the documentation and/or other materials provided
 * with the distribution. 3) Neither the name of the s3auth.com nor
 * the names of its contributors may be used to endorse or promote
 * products derived from this software without specific prior written
 * permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT
 * NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
 * FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 * THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
 * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 * OF THE POSSIBILITY OF SUCH DAMAGE.
 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    version="2.0" exclude-result-prefixes="xs">

    <xsl:output method="xml" omit-xml-declaration="yes"/>

    <xsl:include href="/xsl/layout.xsl" />

    <xsl:template name="head">
        <title>
            <xsl:text>index</xsl:text>
        </title>
        <link rel="stylesheet" type="text/css">
            <xsl:attribute name="href">
                <xsl:text>/css/index.css?</xsl:text>
                <xsl:value-of select="/page/version/revision"/>
            </xsl:attribute>
        </link>
    </xsl:template>

    <xsl:template name="content">
        <xsl:choose>
            <xsl:when test="/page/domains/domain">
                <p>
                    <xsl:text>Your registered domains:</xsl:text>
                </p>
                <ul>
                    <xsl:apply-templates select="/page/domains/domain"/>
                </ul>
            </xsl:when>
            <xsl:otherwise>
                <p>
                    <xsl:text>You haven't registered any domains yet.</xsl:text>
                </p>
            </xsl:otherwise>
        </xsl:choose>
        <p>
            <xsl:text>Register new domain using the form:</xsl:text>
        </p>
        <form method="post">
            <xsl:attribute name="action">
                <xsl:value-of select="/page/links/link[@rel='add']/@href" />
            </xsl:attribute>
            <p>
                <label><xsl:text>Host name (the same as S3 bucket name):</xsl:text></label>
                <input name="host" />
                <label><xsl:text>AWS key:</xsl:text></label>
                <input name="key" size="30" maxlength="20" />
                <label><xsl:text>AWS secret key:</xsl:text></label>
                <input name="secret" size="40" maxlength="40" />
                <label><xsl:text>&#160;</xsl:text></label>
                <input type="submit" value="add" />
            </p>
        </form>
    </xsl:template>

    <xsl:template match="domain">
        <li>
            <span class="tt"><xsl:value-of select="name"/></span>
            <xsl:text> (key: </xsl:text>
            <xsl:value-of select="key"/>
            <xsl:text>, secret: </xsl:text>
            <xsl:value-of select="secret"/>
            <xsl:text>)</xsl:text>
        </li>
    </xsl:template>

</xsl:stylesheet>
