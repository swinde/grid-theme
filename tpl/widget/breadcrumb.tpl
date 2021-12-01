[{block name="dd_widget_breadcrumb"}]
    [{strip}]
        [{block name="dd_widget_breadcrumb_list_inner"}]
            <nav aria-label="breadcrumb">
                <ol id="breadcrumb" class="nav--breadcrumb breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList">
                    [{block name="dd_widget_breadcrumb_list"}]
                        <li class="text-muted">[{oxmultilang ident="YOU_ARE_HERE"}]:</li>

                        [{foreach from=$oView->getBreadCrumb() item="sCrum" name="breadcrumb"}]
                            <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem" class="breadcrumb-item[{if $smarty.foreach.breadcrumb.last}] active[{/if}]">
                                <a href="[{if $sCrum.link}][{$sCrum.link}][{else}]#[{/if}]" class="breadcrumb-link" title="[{$sCrum.title|escape:'html'}]" itemprop="item">
                                    <span itemprop="name">[{$sCrum.title}]</span>
                                </a>
                                <meta itemprop="position" content="[{$smarty.foreach.breadcrumb.iteration}]" />
                            </li>
                        [{/foreach}]
                    [{/block}]
                </ol>
            </nav>

        [{/block}]
    [{/strip}]
[{/block}]
