<div class="refineParams row clear[{if $place == "bottom"}] bottomParams[{/if}]">
    [{if $locator}]
        <div class="col-12 col-sm-12 col-lg-6 pagination-options">
            [{if $place != "bottom"}]
            <nav class="float-left">
            [{/if}]
            [{include file="widget/locator/paging.tpl" pages=$locator place=$place}]
            [{if $place != "bottom"}]
            </nav>
            [{/if}]
        </div>
    [{/if}]

    [{if $listDisplayType || $sort || $itemsPerPage}]
    <div class="col-12 col-sm-12 col-lg-6 options">
        [{if $listDisplayType}]
        [{include file="widget/locator/listdisplaytype.tpl"}]
        [{/if}]

        [{if $sort}]
        [{include file="widget/locator/sort.tpl"}]
        [{/if}]

        [{if $itemsPerPage}]
        [{include file="widget/locator/itemsperpage.tpl"}]
        [{/if}]
    </div>
    [{/if}]

    [{if $place != "bottom"}]
    <div class="col-12 text-right">
        [{include file="widget/locator/attributes.tpl"}]
    </div>
    [{/if}]
</div>