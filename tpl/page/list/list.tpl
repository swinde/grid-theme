[{assign var="actCategory" value=$oView->getActiveCategory()}]

[{capture append="oxidBlock_sidebar"}]
    [{assign var="listType" value=$oView->getListType()}]
    [{if $listType=='manufacturer' || $listType=='vendor'}]
        [{if $actCategory && $actCategory->getIconUrl()}]
        <div class="box">
            <h3>
                [{if $listType=='manufacturer'}]
                    [{oxmultilang ident="BRAND"}]
                [{elseif $listType=='vendor'}]
                    [{oxmultilang ident="VENDOR"}]
                [{/if}]
            </h3>
            <div class="featured icon">
                <img src="[{$oViewConf->getImageUrl('spinner.gif')}]" data-src="[{$actCategory->getIconUrl()}]" alt="[{$actCategory->getTitle()}]">
            </div>
        </div>
        [{/if}]
    [{/if}]
[{/capture}]

[{capture append="oxidBlock_content"}]
    [{block name="page_list_listhead"}]
        <div class="page-header">
            [{assign var='rsslinks' value=$oView->getRssLinks()}]
            <h1 class="h1">
                [{$actCategory->getTitle()}]
                [{if $rsslinks.activeCategory}]
                    <a class="rss" id="rssActiveCategory" aria-label="RSS Current Category" href="[{$rsslinks.activeCategory.link}]" title="[{$rsslinks.activeCategory.title}]" target="_blank">
                        <i class="fas fa-rss"></i>
                    </a>
                [{/if}]
            </h1>
        </div>
        <div class="row">
            [{if $actCategory->oxcategories__oxthumb->value && $actCategory->getThumbUrl()}]
                <div class="col-xs-12 col-xl-4">
                    <img src="[{$oViewConf->getImageUrl('spinner.gif')}]" data-src="[{$actCategory->getThumbUrl()}]" alt="[{$actCategory->oxcategories__oxtitle->value}]" class="categoryPicture img-fluid img-thumbnail">
                </div>
            [{/if}]
            [{assign var="oPageNavigation" value=$oView->getPageNavigation()}]
            <div class="col-xs-12 col-xl-8">
                [{if $actCategory && $actCategory->getShortDescription() && $oPageNavigation->actPage == 1}]
                    <p id="catDescLocator" class="categoryDescription">
                        <em>[{$actCategory->oxcategories__oxdesc->rawValue}]</em>
                    </p>
                [{/if}]

                [{if $actCategory->oxcategories__oxlongdesc->value && $oPageNavigation->actPage == 1}]
                    <div id="catLongDescLocator" class="categoryDescription mt-3 mt-md-0">[{oxeval var=$actCategory->oxcategories__oxlongdesc}]</div>
                [{/if}]
            </div>
            <hr/>
        </div>
        [{if $oView->hasVisibleSubCats()}]
            [{assign var="iSubCategoriesCount" value=0}]
            <div class="subcatList">
                <div class="row">
                    [{foreach from=$oView->getSubCatList() item=category name=MoreSubCat}]
                        [{if $category->getContentCats()}]
                            [{foreach from=$category->getContentCats() item=ocont name=MoreCms}]
                                [{assign var="iSubCategoriesCount" value=$iSubCategoriesCount+1}]
                                <div class="box">
                                    <h3>
                                        <a id="moreSubCms_[{$smarty.foreach.MoreSubCat.iteration}]_[{$smarty.foreach.MoreCms.iteration}]" href="[{$ocont->getLink()}]">[{$ocont->oxcontents__oxtitle->value}]</a>
                                    </h3>
                                    <ul class="content"></ul>
                                </div>
                            [{/foreach}]
                        [{/if}]
                        [{if $iSubCategoriesCount%4 == 0 and $iSubCategoriesCount neq 0}]
                            </div><div class="row">
                        [{/if}]
                        [{if $category->getIsVisible()}]
                            [{assign var="iSubCategoriesCount" value=$iSubCategoriesCount+1}]
                            [{assign var="iconUrl" value=$category->getIconUrl()}]
                            <div class="col-xs-12 col-sm-3">
                                <div class="card-wrapper">
                                    <div class="card">
                                        <div class="card-header">
                                            <a id="moreSubCat_[{$smarty.foreach.MoreSubCat.iteration}]" href="[{$category->getLink()}]">[{$category->oxcategories__oxtitle->value}]</a>[{if $oView->showCategoryArticlesCount() && ($category->getNrOfArticles() > 0)}] ([{$category->getNrOfArticles()}])[{/if}]
                                        </div>
                                        <div class="card-body">
                                            [{if $iconUrl}]
                                                <a href="[{$category->getLink()}]">
                                                    <img src="[{$oViewConf->getImageUrl('spinner.gif')}]" data-src="[{$category->getIconUrl()}]" alt="[{$category->oxcategories__oxtitle->value}]" class="img-fluid subcat-icon">
                                                </a>
                                            [{else}]
                                                <a href="[{$category->getLink()}]" class="btn btn-block btn-info">[{oxmultilang ident="DD_LIST_SHOW_MORE" suffix="ELLIPSIS"}]</a>
                                            [{/if}]

                                            [{if $category->getHasVisibleSubCats()}]
                                                <hr/>
                                                <ul class="list-unstyled">
                                                    [{foreach from=$category->getSubCats() item=subcategory}]
                                                        [{if $subcategory->getIsVisible()}]
                                                            [{foreach from=$subcategory->getContentCats() item=ocont name=MoreCms}]
                                                                <li>
                                                                    <a href="[{$ocont->getLink()}]"><strong>[{$ocont->oxcontents__oxtitle->value}]</strong></a>
                                                                </li>
                                                            [{/foreach}]
                                                            <li>
                                                                <a href="[{$subcategory->getLink()}]">[{$subcategory->oxcategories__oxtitle->value}]</a>[{if $oView->showCategoryArticlesCount() && ($subcategory->getNrOfArticles() > 0)}]&nbsp;([{$subcategory->getNrOfArticles()}])[{/if}]
                                                            </li>
                                                        [{/if}]
                                                    [{/foreach}]
                                                </ul>
                                            [{/if}]
                                        </div>
                                    </div>
                                </div>
                            </div>
                        [{/if}]
                        [{if $iSubCategoriesCount%4 == 0}]
                            </div>
                            <div class="row">
                        [{/if}]
                    [{/foreach}]
                </div>
            </div>
            <hr/>
        [{/if}]
    [{/block}]

    [{block name="page_list_listbody"}]
        [{if $oView->getArticleList()}]
            [{if $oView->getArticleList()|count}]
                [{block name="page_list_upperlocator"}]
                    <div class="listRefine">
                        [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigationLimitedTop() attributes=$oView->getAttributes() listDisplayType=true itemsPerPage=true sort=true}]
                    </div>
                [{/block}]

                [{* List types: grid|line|infogrid *}]
                [{block name="page_list_productlist"}]
                    [{include file="widget/product/list.tpl" type=$oView->getListDisplayType() listId="productList" products=$oView->getArticleList()}]
                [{/block}]
                [{block name="page_list_bottomlocator"}]
                    [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigationLimitedBottom() place="bottom"}]
                [{/block}]
            [{/if}]
        [{/if}]
    [{/block}]
    [{insert name="oxid_tracker"}]
[{/capture}]
[{include file="layout/page.tpl" tree_path=$oView->getTreePath()}]
