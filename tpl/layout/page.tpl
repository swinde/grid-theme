[{capture append="oxidBlock_pageBody"}]
    [{if $oView->showRDFa()}]
        [{include file="rdfa/rdfa.tpl"}]
    [{/if}]
    [{assign var="blFullwidth" value=$oViewConf->getViewThemeParam('blFullwidthLayout')}]

    <div id="main">
        <div class="inner">
            <!--Header-->
            <header class="header">
                [{block name="layout_header"}]
                [{include file="layout/header.tpl"}]
                [{/block}]
            </header>

            <div id="content">

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
            <div class="footer">
                <footer >
                    [{include file="layout/footer.tpl"}]
                    [{block name="layout_init_social"}][{/block}]
                </footer>
            </div>

        </div>
    </div>
    [{*<div id="sidebar">
        <div class="inner">
            [{block name="layout_sidebar"}]
                [{include file="layout/sidebar.tpl"}]
            [{/block}]
        </div>
        *}][{*<a href="#sidebar" class="toggle">Toggle</a>*}][{*
    </div>*}]

    <i class="fa fa-chevron-circle-up icon-4x" id="jumptotop"></i>
[{/capture}]
[{include file="layout/base.tpl"}]
