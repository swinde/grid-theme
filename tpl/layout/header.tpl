[{if $oViewConf->getTopActionClassName() != 'clearcookies' && $oViewConf->getTopActionClassName() != 'mallstart'}]
    [{oxid_include_widget cl="oxwCookieNote" _parent=$oView->getClassName() nocookie=1}]
[{/if}]
[{block name="header_main"}]
    [{assign var="showNavHoriz" value=$oViewConf->getViewThemeParam('sw_showNavHoriz')}]
                        <div class="col-12 col-md-3 logo">
                            [{block name="layout_header_logo"}]
                                [{assign var="slogoImg" value=$oViewConf->getViewThemeParam('sLogoFile')}]
                                [{assign var="sLogoWidth" value=$oViewConf->getViewThemeParam('sLogoWidth')}]
                                [{assign var="sLogoHeight" value=$oViewConf->getViewThemeParam('sLogoHeight')}]
                                <a href="[{$oViewConf->getHomeLink()}]" title="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]" class="logo-link">
                                    <img src="[{$oViewConf->getImageUrl($slogoImg)}]" alt="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]" style="[{if $sLogoWidth}]width:auto;max-width:[{$sLogoWidth}]px;[{/if}][{if $sLogoHeight}]height:auto;max-height:[{$sLogoHeight}]px;[{/if}]" class="logo-img">
                                </a>
                            [{/block}]
                        </div>
                        <div class="col-12 col-md-6 search">
                            [{include file="widget/header/search.tpl"}]
                        </div>
                        <div class="col-12 col-md-3 menu">
                            [{block name="layout_header_top"}]
                                <div class="menu-dropdowns">
                                    [{block name="dd_layout_page_header_icon_menu_languages"}]
                                        [{* Language Dropdown*}]
                                        [{oxid_include_widget cl="oxwLanguageList" lang=$oViewConf->getActLanguageId() _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]
                                    [{/block}]
                                    [{block name="dd_layout_page_header_icon_menu_currencies"}]
                                        [{* Currency Dropdown*}]
                                        [{oxid_include_widget cl="oxwCurrencyList" cur=$oViewConf->getActCurrency() _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]
                                    [{/block}]

                                    [{block name="dd_layout_page_header_icon_menu_account"}]
                                        [{if $oxcmp_user || $oView->getCompareItemCount() || $Errors.loginBoxErrors}]
                                            [{assign var="blAnon" value=0}]
                                            [{assign var="force_sid" value=$oViewConf->getSessionId()}]
                                        [{else}]
                                            [{assign var="blAnon" value=1}]
                                        [{/if}]
                                        [{* Account Dropdown *}]
                                        [{oxid_include_widget cl="oxwServiceMenu" _parent=$oView->getClassName() force_sid=$force_sid nocookie=$blAnon _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]
                                    [{/block}]

                                    [{block name="dd_layout_page_header_icon_menu_minibasket"}]
                                        [{* Minibasket Dropdown *}]
                                        [{if $oxcmp_basket->getProductsCount()}]
                                            [{assign var="blAnon" value=0}]
                                            [{assign var="force_sid" value=$oViewConf->getSessionId()}]
                                        [{else}]
                                            [{assign var="blAnon" value=1}]
                                        [{/if}]
                                        [{oxid_include_widget cl="oxwMiniBasket" nocookie=$blAnon force_sid=$force_sid}]
                                    [{/block}]
                                </div>
                            [{/block}]
                        </div>

            [{* Umschalten zwischen 1 Spaltenlayout mit horiz. Navigation  *}]
            [{if $showNavHoriz}]
                [{block name="layout_header_bottom"}]
                [{oxid_include_widget cl="oxwCategoryTree" cnid=$oView->getCategoryId() sWidgetType="header" _parent=$oView->getClassName() nocookie=1}]
                [{/block}]
            [{* Umschalten 2 Spaltenlayout mit verticaler Navigation  *}]
            [{else}]
                [{block name="layout_header_bottom"}]
                 [{/block}]
            [{/if}]


[{/block}]

[{insert name="oxid_newbasketitem" tpl="widget/minibasket/newbasketitemmsg.tpl" type="message"}]
[{oxid_include_dynamic file="widget/minibasket/minibasketmodal.tpl"}]
