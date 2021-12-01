[{capture append="oxidBlock_pageBody"}]
    [{if $oView->showRDFa()}]
        [{include file="rdfa/rdfa.tpl"}]
    [{/if}]
    [{assign var="showNavHoriz" value=$oViewConf->getViewThemeParam('sw_showNavHoriz')}]
        <!--Header-->
        <header class="header">
            <div class="row inner">
                [{block name="layout_header"}]
                    [{include file="layout/header.tpl"}]
                [{/block}]
            </div>
        </header>
        [{*Umschalter 1 Spalten oder 2 Spalten*}]
        [{if $showNavHoriz}]
        <div class="content">
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
        [{else}]

        <div class="row">
            <div class="col-12 col-md-3 col-lg-3 sidebar">
                [{include file="layout/leftcol.tpl"}]
            </div>
            <div id="content" class="col-12 col-md-9 col-lg-9 content">
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
        [{/if}]

        <footer class="footer">
            [{include file="layout/footer.tpl"}]
            [{block name="layout_init_social"}]
        </footer>
    [{/block}]

    <i class="fa fa-chevron-circle-up icon-4x" id="jumptotop"></i>
[{/capture}]
[{include file="layout/base.tpl"}]
