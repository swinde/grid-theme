[{capture append="oxidBlock_pageBody"}]
    [{if $oView->showRDFa()}]
        [{include file="rdfa/rdfa.tpl"}]
    [{/if}]
    [{*assign var="blFullwidth" value=$oViewConf->getViewThemeParam('blFullwidthLayout')*}]
    [{assign var="showNavHoriz" value=$oViewConf->getViewThemeParam('sw_showNavHoriz')}]
        <!--Header-->
        <header class="header">
            [{block name="layout_header"}]
            [{include file="layout/header.tpl"}]
            [{/block}]
        </header>
        <div class="main">
            <div class="[{if $showNavHoriz}]col-lg-12[{else}]col-lg-3 sidebar[{/if}]">
                [{include file="layout/leftcol.tpl"}]
            </div>
            <div id="content" class="[{if $showNavHoriz}]col-lg-12[{else}]col-lg-9[{/if}] content">
                <div class="inner">
                    [{if $oView->getClassName()=='start' && $oView->getBanners() && !empty($oView->getBanners())}]
                    [{include file="widget/promoslider.tpl"}]
                    [{/if}]

                    [{if $oView->getClassName() != "start" && !$blHideBreadcrumb}]
                    [{block name="layout_breadcrumb"}]
                    [{include file="widget/breadcrumb.tpl"}]
                    [{/block}]
                    [{/if}]
                    [{$smarty.capture.loginErrors}]
                    [{block name="content_main"}]
                    [{include file="message/errors.tpl"}]

                    [{foreach from=$oxidBlock_content item="_block"}]
                    [{$_block}]
                    [{/foreach}]
                    [{/block}]
                </div>

            </div>
        </div>

        <footer class="footer">
        [{include file="layout/footer.tpl"}]
            [{*[{block name="layout_init_social"}][{/block}]*}]
        </footer>


    <i class="fa fa-chevron-circle-up icon-4x" id="jumptotop"></i>
[{/capture}]
[{include file="layout/base.tpl"}]
