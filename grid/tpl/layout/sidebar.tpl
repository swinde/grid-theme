[{foreach from=$oxidBlock_sidebar item="_block"}]
    [{$_block}]
[{/foreach}]



[{block name="sidebar"}]


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

    [{block name="sidebar_tags"}]
    [{/block}]

    [{block name="sidebar_partners"}]
        [{if $oView->getClassName() eq "start"}]
            [{include file="widget/sidebar/partners.tpl"}]
        [{/if}]
    [{/block}]

    [{block name="sidebar_boxproducts"}][{/block}]

    [{block name="sidebar_recommendation"}]
        [{if $oViewConf->getShowListmania() && $oView->getSimilarRecommListIds()}]
            [{oxid_include_widget nocookie=1 cl="oxwRecommendation" aArticleIds=$oView->getSimilarRecommListIds() searchrecomm=$oView->getRecommSearch()}]
        [{elseif $oViewConf->getShowListmania() && $oView->getRecommSearch()}]
            [{oxid_include_widget nocookie=1 cl="oxwRecommendation" _parent=$oView->getClassName() searchrecomm=$oView->getRecommSearch()}]
        [{/if}]
    [{/block}]

    [{block name="sidebar_news"}]
        [{if $oxcmp_news}]
            [{if $oxcmp_news|count}]
                [{include file="widget/sidebar/news.tpl" oNews=$oxcmp_news}]
            [{/if}]
        [{/if}]
    [{/block}]

    [{block name="sidebar_social"}]
    [{/block}]

    [{block name="sidebar_shopluperatings"}]
        [{if $oView->getClassName() eq "start"}]
           [{include file="widget/shoplupe/ratings.tpl"}]
        [{/if}]
    [{/block}]
[{/block}]




