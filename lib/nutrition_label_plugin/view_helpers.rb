module NutritionLabelPlugin 
  module ViewHelpers
    def pre(text)
      content_tag :pre, text
    end

    FAT_CAL_PER_GRAM = 9
    PROTEIN_CAL_PER_GRAM = 4
    CARB_CAL_PER_GRAM = 4
    CONVERT_TO_PERCENT = 100
    RDV_FAT = 65
    RDV_SAT_FAT = 20
    RDV_CHOLESTEROL = 300
    RDV_SODIUM = 2400
    RDV_CARB = 300
    RDV_FIBER = 25
    RDV_VIT_C = 60 
    RDV_VIT_A = 5000 
    RDV_IRON = 18 
    RDV_CALCIUM = 1000  
    RDV_FAT_2500 = 80
    RDV_SAT_FAT_2500 = 25
    RDV_CARB_2500 = 375
    RDV_FIBER_2500 = 30

    def create_base_label(nutrient) 
      output =  
        "<div id='nutritionfactstable' style='float:left'>  
        <div> 
        #{ image_tag('nutritionFactslogo.jpg', :width => '207', :border => '0') } 
        </div> 
        <div id='servingsize'> 
        Serving Size 1 #{ nutrient[:name] if nutrient[:name] } (#{ sprintf '%1.f', 
          nutrient[:yield] if nutrient[:yield] }g) 
        <br> 
        Servings Per Container: #{ sprintf '%1.f', nutrient[:servings] if nutrient[:servings] } 
        </div>  
        <div id='thickseparator'></div> 
        <div id='label'>Amount Per Serving</div>  
        <div id='hairlineseparator'></div>  
        <div id='nutrient'> 
        <div id='right'>  
        <span id='nutrientcontent'>Calories from Fat #{ sprintf '%1.f', 
          nutrient[:fat]*FAT_CAL_PER_GRAM if nutrient[:fat]}</span>  
        </div>  
        Calories  
        <span id='nutrientcontent'>#{ sprintf '%1.f', 
          nutrient[:calories] if nutrient[:calories]}</span>  
        </div>  
        <div id='separator'></div>  
        <div id='label'>  
        <div id='right'>%Daily Value*</div> 
        &#8194;  
        </div> 
        <div id='hairlineseparator'></div> 
        <div id='nutrient'>  
        <div id='right'> 
        #{ sprintf '%1.d',nutrient[:fat]*CONVERT_TO_PERCENT/RDV_FAT if nutrient[:fat] }<span id=
          'nutrientcontent'>%</span> 
        </div> 
        Total Fat  
        <span id='nutrientcontent'>#{ sprintf '%1.d',nutrient[:fat] if nutrient[:fat] }g</span>  
        <div id='subhairlineseparator'></div>  
        <div id='nutrientsubgroup'>  
        <div id='subright'>  
        #{ sprintf '%1.f', nutrient[:saturated_fat]*CONVERT_TO_PERCENT/RDV_SAT_FAT if 
          nutrient[:saturated_fat] }<span id='nutrientcontent'>%</span>
        </div>  
        Saturated Fat   
        <span id='nutrientcontent'>#{ sprintf '%1.f', 
          nutrient[:saturated_fat] if nutrient[:saturated_fat] }g</span>  
        </div>  
        <div id='subhairlineseparator'></div> 
        <div id='nutrientsubgroup'> 
        <i>Trans </i> 
        Fat 
        <span id='nutrientcontent'>#{ sprintf '%1.f', 
          nutrient[:trans_fat] if nutrient[:trans_fat] }g</span>  
        </div>  
        <div id='hairlineseparator'></div>  
        <div id='nutrient'> 
        <div id='right'>  
        #{ sprintf '%1.f', nutrient[:cholesterol]*CONVERT_TO_PERCENT/RDV_CHOLESTEROL if nutrient[:cholesterol] }<span id='nutrientcontent'>%</span>  
        </div>  
        Cholesterol 
        <span id='nutrientcontent'>#{ sprintf '%1.f', 
          nutrient[:cholesterol] if nutrient[:cholesterol] }mg</span> 
        </div>  
        <div id='hairlineseparator'></div>  
        <div id='nutrient'> 
        <div id='right'>  
        #{ sprintf '%1.f', nutrient[:sodium]*CONVERT_TO_PERCENT/RDV_SODIUM if nutrient[:sodium] }<span id='nutrientcontent'>%</span> 
        </div>  
        Sodium  
        <span id='nutrientcontent'>#{ sprintf '%1.f', 
          nutrient[:sodium] if nutrient[:sodium] }mg</span> 
        </div>  
        <div id='hairlineseparator'></div>  
        <div id='nutrient'> 
        <div id='right'>  
        #{ sprintf '%1.f', nutrient[:carbohydrate]*CONVERT_TO_PERCENT/RDV_CARB if nutrient[:carbohydrate] }<span id='nutrientcontent'>%</span>  
        </div>  
        Total Carbohydrate  
        <span id='nutrientcontent'>#{ sprintf '%1.f', 
          nutrient[:carbohydrate] if nutrient[:carbohydrate] }g</span>  
        </div>  
        <div id='subhairlineseparator'></div> 
        <div id='nutrientsubgroup'> 
        <div id='subright'> 
        #{ sprintf '%1.f', nutrient[:fiber]*CONVERT_TO_PERCENT/RDV_FIBER if nutrient[:fiber] }<span id='nutrientcontent'>%</span>
        </div>  
        Dietary Fiber 
        <span id='nutrientcontent'>#{ sprintf '%1.f', 
          nutrient[:fiber] if nutrient[:fiber] }g</span>  
        </div>  
        <div id='subhairlineseparator'></div> 
        <div id='nutrientsubgroup'> 
        Sugars  
        <span id='nutrientcontent'>#{ sprintf '%1.f', 
          nutrient[:sugar] if nutrient[:sugar] }g</span>  
        </div>  
        <div id='hairlineseparator'></div>  
        <div id='nutrient'> 
        Protein 
        <span id='nutrientcontent'>#{ sprintf '%1.f', 
          nutrient[:sugar] if nutrient[:sugar] }g</span>  
        </div>  
        </div>    
        <div id='thickseparator'></div> 
        <div id='vitamin'>  
        <div id='vitaminright'>Vitamin C #{ sprintf '%1.f', 
          nutrient[:vitamin_C]*CONVERT_TO_PERCENT/RDV_VIT_C if nutrient[:vitamin_C] }%</div>  
        <div id='vitaminbullet'>&#8226;</div> 
        Vitamin A #{ sprintf '%1.f', nutrient[:vitamin_A]*CONVERT_TO_PERCENT/RDV_VIT_A if nutrient[:vitamin_A] }% 
        </div>  
        <div id='hairlineseparator'></div>  
        <div id='vitamin'>  
        <div id='vitaminright'>Iron #{ sprintf '%1.f', 
          nutrient[:Iron]*CONVERT_TO_PERCENT/RDV_IRON if nutrient[:Iron] }%</div> 
        <div id='vitaminbullet'>&#8226;</div> 
        Calcium #{ sprintf '%1.f', nutrient[:calcium]*CONVERT_TO_PERCENT/RDV_CALCIUM if nutrient[:calcium] }% 
        </div>        
        <div id='hairlineseparator'></div>  
        <div id='asterisksection'>  
        * Percent Daily Values are based on a 2,000 calorie diet. 
          Your daily values may be higher or lower depending on your calorie needs: 
        <div id='hairlineseparator'></div>  
        <table id='asterisksection' width='207' frame='below' 
        rules='groups' border='1' cellspacing='0'>  
        <thead> 
        <tr id='hairlineseparator'> 
        <td></td>
        <td>Calories:</td>
        <td>2,000</td>
        <td>2,500</td>
        </tr>
        </thead>  
        <tbody> 
        <tr>  
        <td>Total Fat</td>
        <td>Less than</td>
        <td>#{RDV_FAT}g</td>
        <td>#{RDV_FAT_2500}g</td>
        </tr>
        <tr>  
        <td>&#8194;Sat Fat</td>
        <td>Less than</td>
        <td>#{RDV_SAT_FAT}g</td>
        <td>#{RDV_SAT_FAT_2500}g</td>
        </tr>
        <tr>  
        <td>Cholesterol</td>
        <td>Less than</td>
        <td>#{RDV_CHOLESTEROL}mg</td>
        <td>#{RDV_CHOLESTEROL}mg</td>
        </tr>
        <tr>  
        <td>Sodium</td>
        <td>Less than</td>
        <td>#{RDV_SODIUM}mg</td>
        <td>#{RDV_SODIUM}mg</td>
        </tr>
        <tr>
        <td>Total Carb</td>
        <td></td>
        <td>#{RDV_CARB}g</td>
        <td>#{RDV_CARB_2500}g</td>
        </tr>
        <tr>
        <td>&#8194;Dietary Fiber</td>
        <td></td>
        <td>#{RDV_FIBER}g</td>
        <td>#{RDV_FIBER}g</td>
        </tr>
        <tr id='hairlineseparator'>
        </tr>
        </tbody>  
        </table>  
        <div id='hairlineseparatornopadding'></div> 
        </div>  
        </div>  
        </div>"   
        output.html_safe  
    end 
    
  end
end
