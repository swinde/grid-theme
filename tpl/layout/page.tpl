[{capture append="oxidBlock_pageBody"}]
    [{if $oView->showRDFa()}]
        [{include file="rdfa/rdfa.tpl"}]
    [{/if}]
    [{assign var="blFullwidth" value=$oViewConf->getViewThemeParam('blFullwidthLayout')}]
    <section class="navigation">

        [{block name="sidebar_categoriestree"}]
        <div class="categorytree">
            <section>
                <div class="page-header h3">
                    [{oxmultilang ident="CATEGORIES"}]
                </div>
                [{oxid_include_widget cl="oxwCategoryTree" cnid=$oView->getCategoryId() sWidgetType="header" _parent=$oView->getClassName() nocookie=1}]
            </section>
        </div>

        [{/block}]
    </section>
    <section class="main">
        <!--Header-->
        <header class="header">
            [{block name="layout_header"}]
            [{include file="layout/header.tpl"}]
            [{/block}]
        </header>

        <div id="content">
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
    </section>
    <section class="footer">
        <footer >
            [{include file="layout/footer.tpl"}]
            [{block name="layout_init_social"}][{/block}]
        </footer>
    </section>
    <i class="fa fa-chevron-circle-up icon-4x" id="jumptotop"></i>
[{/capture}]
[{include file="layout/base.tpl"}]
