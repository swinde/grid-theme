/**
 * This file is part of OXID eSales Wave theme.
 *
 * OXID eSales Wave theme is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * OXID eSales Wave theme is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with OXID eSales Wave theme.  If not, see <http://www.gnu.org/licenses/>.
 *
 * @link      http://www.oxid-esales.com
 * @copyright (C) OXID eSales AG 2003-2016
 */
$(window).on('load', function(){
    if($('.cl-start').length >0 ){

        var $window = $( this ),
            $oManufacturerSlider = $( '#manufacturerSlider .flexslider' ),
            flexslider;

        function getGridSize()
        {
            return ( $oManufacturerSlider.width() < 600 ) ? 3 :
                   ( $oManufacturerSlider.width() < 900 ) ? 5 : 7;
        }


        $( '#promo-carousel' ).flexslider(
            {
                animation: "slide"
            }
        );

        flexslider = $oManufacturerSlider.flexslider(
            {
                animation: "slide",
                itemWidth: 100,
                itemMargin: 10,
                minItems: getGridSize(), // use function to pull in initial value
                maxItems: getGridSize() // use function to pull in initial value
            }
        );

        // check grid size on resize event
        $window.resize( function()
            {
                var gridSize = getGridSize();

                flexslider.data().flexslider.vars.minItems = gridSize;
                flexslider.data().flexslider.vars.maxItems = gridSize;
            }
        );
    }
});
/*
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
*/

