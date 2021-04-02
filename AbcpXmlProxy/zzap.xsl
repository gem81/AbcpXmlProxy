<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<root>
<xsl:for-each select="/root/table">
<row>
<code_doc_b>
<xsl:value-of   select="./code_doc_b"/>
</code_doc_b>
<code_cat>
<xsl:value-of   select="./code_cat"/>
</code_cat>
<descr_type_search>
<xsl:value-of   select="./descr_type_search"/>
</descr_type_search>
<type_search>
<xsl:value-of   select="./type_search"/>
</type_search>
<class_man>
<xsl:value-of   select="./class_man"/>
</class_man>
<logopath>
<xsl:value-of   select="./logopath"/>
</logopath>
<partnumber>
<xsl:value-of   select="./partnumber"/>
</partnumber>
<class_cat>
<xsl:value-of   select="./class_cat"/>
</class_cat>
<imagepath>
<xsl:value-of   select="./imagepath"/>
</imagepath>
<qty>
<xsl:value-of   select="./qty"/>
</qty>
<instock>
<xsl:value-of   select="./instock"/>
</instock>
<wholesale>
<xsl:value-of   select="./wholesale"/>
</wholesale>
<local>
<xsl:value-of   select="./local"/>
</local>
<price>
<xsl:value-of   select="./price"/>
</price>
<price_date>
<xsl:value-of   select="./price_date"/>
</price_date>
<descr_price>
<xsl:value-of   select="./descr_price"/>
</descr_price>
<descr_qty>
<xsl:value-of   select="./descr_qty"/>
</descr_qty>
<class_user>
<xsl:value-of   select="./class_user"/>
</class_user>
<descr_rating_count>
<xsl:value-of   select="./descr_rating_count"/>
</descr_rating_count>
<rating>
<xsl:value-of   select="./rating"/>
</rating>
<descr_address>
<xsl:value-of   select="./descr_address"/>
</descr_address>
<phone1>
<xsl:value-of   select="./phone1"/>
</phone1>
<order_text>
<xsl:value-of   select="./order_text"/>
</order_text>
<user_key>
<xsl:value-of   select="./user_key"/>
</user_key>
<addr_map_geo1>
<xsl:value-of   select="./addr_map_geo1"/>
</addr_map_geo1>
<addr_map_geo2>
<xsl:value-of   select="./addr_map_geo2"/>
</addr_map_geo2>
<used>
<xsl:value-of   select="./used"/>
</used>
<apply>
<xsl:value-of   select="./apply"/>
</apply>
<min_sum_order>
<xsl:value-of   select="./min_sum_order"/>
</min_sum_order>
<descr_min_sum_order>
<xsl:value-of   select="./descr_min_sum_order"/>
</descr_min_sum_order>
<shipment>
<xsl:value-of   select="./shipment"/>
</shipment>
<courier>
<xsl:value-of   select="./courier"/>
</courier>
<instockV2>
<xsl:value-of   select="./instockV2"/>
</instockV2>
<wholesaleV2>
<xsl:value-of   select="./wholesaleV2"/>
</wholesaleV2>
<localV2>
<xsl:value-of   select="./localV2"/>
</localV2>
<usedV2>
<xsl:value-of   select="./usedV2"/>
</usedV2>
<priceV2>
<xsl:value-of   select="./priceV2"/>
</priceV2>
<descr_priceV2>
<xsl:value-of   select="./descr_priceV2"/>
</descr_priceV2>
<price_orig>
<xsl:value-of   select="./price_orig"/>
</price_orig>
<descr_price_orig>
<xsl:value-of   select="./descr_price_orig"/>
</descr_price_orig>
<descr_type_price>
<xsl:value-of   select="./descr_type_price"/>
</descr_type_price>
<qtyV2>
<xsl:value-of   select="./qtyV2"/>
</qtyV2>
<qty_max>
<xsl:value-of   select="./qty_max"/>
</qty_max>
<descr_qtyV2>
<xsl:value-of   select="./descr_qtyV2"/>
</descr_qtyV2>
<delivery_days>
<xsl:value-of   select="./delivery_days"/>
</delivery_days>
<descr_delivery>
<xsl:value-of   select="./descr_delivery"/>
</descr_delivery>
<type_user>
<xsl:value-of   select="./type_user"/>
</type_user>
<type_user2>
<xsl:value-of   select="./type_user2"/>
</type_user2>
<type_price>
<xsl:value-of   select="./type_price"/>
</type_price>
<imagepathV2>
<xsl:value-of   select="./imagepathV2"/>
</imagepathV2>
<descr_price_date>
<xsl:value-of   select="./descr_price_date"/>
</descr_price_date>
<pack>
<xsl:value-of   select="./pack"/>
</pack>
<descr_pack>
<xsl:value-of   select="./descr_pack"/>
</descr_pack>
<type_chain_search>
<xsl:value-of   select="./type_chain_search"/>
</type_chain_search>
<noorig>
<xsl:value-of   select="./noorig"/>
</noorig>
<code_man>
<xsl:value-of   select="./code_man"/>
</code_man>
</row>
</xsl:for-each>
</root>
</xsl:template>
</xsl:stylesheet>