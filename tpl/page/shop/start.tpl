[{capture append="oxidBlock_content"}]
    [{assign var="oConfig" value=$oViewConf->getConfig()}]
    [{assign var='rsslinks' value=$oView->getRssLinks()}]

    [{block name="start_welcome_text"}]

        <div class="row">
            [{oxifcontent ident="oxstartwelcome" object="oCont"}]
            <div class="welcome-teaser col-lg-8">[{$oCont->oxcontents__oxcontent->value}]</div>
            [{/oxifcontent}]
            <aside class="col-lg-4">
                [{oxifcontent ident="sw_aktuelles" object="_cont"}]
                <div class="start_aktuelles"><h3>[{$_cont->oxcontents__oxtitle->value}]</h3>[{ oxcontent ident=sw_aktuelles }]</div>
                [{/oxifcontent}]
            </aside>
        </div>

    [{/block}]
    [{if $promoCatTitle && $promoCatImg}]
    <div id="specCatBox" class="specCatBox">
        <h2 class="sectionHead">[{$promoCatTitle}]</h2>
        <a href="[{$promoCatLink}]" class="viewAllHover glowShadow corners"><span>[{ oxmultilang ident="PAGE_SHOP_START_VIEW_ALL" }]</span></a>
        <img src="[{$promoCatImg}]" alt="[{$promoCatTitle}]">
    </div>
    [{/if}]


    [{assign var="oTopArticles" value=$oView->getTop5ArticleList()}]

    [{block name="start_bargain_articles"}]
        [{assign var="oBargainArticles" value=$oView->getBargainArticleList()}]
        [{if $oBargainArticles && $oBargainArticles->count()}]
            [{include file="widget/product/list.tpl" type=$oViewConf->getViewThemeParam('sStartPageListDisplayType') head="START_BARGAIN_HEADER"|oxmultilangassign subhead="START_BARGAIN_SUBHEADER"|oxmultilangassign listId="bargainItems" products=$oBargainArticles rsslink=$rsslinks.bargainArticles rssId="rssBargainProducts" showMainLink=true iProductsPerLine=4}]
        [{/if}]
    [{/block}]

    [{block name="start_manufacturer_slider"}]
        [{if $oViewConf->getViewThemeParam('bl_showManufacturerSlider')}]
            [{include file="widget/manufacturersslider.tpl"}]
        [{/if}]
    [{/block}]

    [{block name="start_newest_articles"}]
        [{assign var="oNewestArticles" value=$oView->getNewestArticles()}]
        [{if $oNewestArticles && $oNewestArticles->count()}]
            [{include file="widget/product/list.tpl" type=$oViewConf->getViewThemeParam('sStartPageListDisplayType') head="START_NEWEST_HEADER"|oxmultilangassign subhead="START_NEWEST_SUBHEADER"|oxmultilangassign listId="newItems" products=$oNewestArticles rsslink=$rsslinks.newestArticles rssId="rssNewestProducts" showMainLink=true iProductsPerLine=4}]
        [{/if}]
    [{/block}]

    [{if $oNewestArticles && $oNewestArticles->count() && $oTopArticles && $oTopArticles->count()}]
        <div class="row">
            <hr>
        </div>
    [{/if}]

    [{block name="start_top_articles"}]
        [{if $oTopArticles && $oTopArticles->count()}]
            [{include file="widget/product/list.tpl" type=$oViewConf->getViewThemeParam('sStartPageListDisplayType') head="START_TOP_PRODUCTS_HEADER"|oxmultilangassign subhead="START_TOP_PRODUCTS_SUBHEADER"|oxmultilangassign:$oTopArticles->count() listId="topBox" products=$oTopArticles rsslink=$rsslinks.topArticles rssId="rssTopProducts" showMainLink=true iProductsPerLine=4}]
        [{/if}]
    [{/block}]

    [{insert name="oxid_tracker"}]
[{/capture}]
[{include file="layout/page.tpl"}]
