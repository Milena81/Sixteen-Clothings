<!-- Bootstrap core CSS -->
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">

     <!-- Additional CSS Files -->
<!--         <link rel="stylesheet" href="/css/stars1.css"> -->
        <link rel="stylesheet" href="/css/fontawesome.css">
        <link rel="stylesheet" href="/css/templatemo-sixteen.css">
        <link rel="stylesheet" href="/css/owl.css">
        <link rel="stylesheet" href="/css/clothing-products.css">

{{ content() }}

{{ flashSession.output() }}

<form id="purchase" action="" method="post">
  <div class="col-lg-8 col-md-8 col-sm-8">
    <div class="form-header-group  header-large">
        <h1 id="header_1" class="form-header" data-component="header">
          Product Order Form
        </h1>
    </div>
    <div>
    <label class="form-label form-label-top" id="label_2" for="first_2"> Full Name: </label>
      <fieldset>
         <input type="text" name="fullname"  class="form-control" id="fullname" placeholder="Full Name" required="">
      </fieldset>
      <br />
      <label class="form-label form-label-top" id="label_3" for="input_3"> E-mail: </label>
      <fieldset>
           <input type="email" id="email" name="email" class="form-control" size="30" value="" placeholder="ex: myname@example.com" required=""/>
      </fieldset>
        <br />
        <label class="form-label form-label-top" id="label_5" for="input_5_area"> Contact Phone Number: </label>
    </div>
    <div class="col-lg-12 col-md-12 col-sm-12">
        <fieldset>
            <input type="tel" id="phone" name="phoneNumber" class="form-control" size="12" value="" required=""/>
        </fieldset><br />
    </div>
    <br />
    <div>
         <label class="form-label form-label-top" id="label_4" for="input_4_addr_line1"> Billing Address: </label>
    </div>
    <div class="col-lg-6 col-md-6 col-sm-6">
        <fieldset>
            <label class="form-sub-label" for="input_4_addr_line1" id="sublabel_4_addr_line1" style="min-height:13px" aria-hidden="false"> Street Address </label>
            <input type="text" id="street" name="street" class="form-control" value="" required="" />
        </fieldset>
    </div>
    <div class="col-lg-6 col-md-6 col-sm-6">
        <fieldset>
            <label class="form-sub-label" for="input_4_addr_line2" id="sublabel_4_addr_line2" style="min-height:13px" aria-hidden="false"> Street Address Line 2 </label>
            <input type="text" id="street2" name="street2" class="form-control" value=""  />
        </fieldset>
    </div>
    <div class="col-lg-6 col-md-6 col-sm-6">
        <fieldset>
            <input type="text" id="city" name="city" class="form-control" value="" required="" />
        </fieldset>
        </div>
    <br />
    <div class="col-lg-6 col-md-6 col-sm-6">
            <fieldset>
                <label class="form-sub-label" for="input_4_addr_line2" id="sublabel_4_addr_line2" style="min-height:13px" aria-hidden="false"> State / Province </label>
                <input type="text" id="state" name="state" class="form-control" size="22" value="" required="" />
            </fieldset>
    </div>
    <div class="col-lg-6 col-md-6 col-sm-6">
            <fieldset>
                <label class="form-sub-label" for="input_4_postal" id="sublabel_4_postal" style="min-height:13px" aria-hidden="false"> Postal / Zip Code </label>
                <input type="text" id="postal" name="postalCode" class="form-control" size="10" value="" required="" />
            </fieldset>
    </div>
    <div class="col-lg-6 col-md-6 col-sm-6">
        <label class="form-sub-label" for="input_4_country" id="sublabel_4_country" style="min-height:13px" aria-hidden="false"> Country </label>
        <select class="form-control" name="country" id="country" required="" >
            <option value=""> Please Select </option>
            <option value="United States"> United States </option>
            <option value="Afghanistan"> Afghanistan </option>
            <option value="Albania"> Albania </option>
            <option value="Algeria"> Algeria </option>
            <option value="American Samoa"> American Samoa </option>
            <option value="Andorra"> Andorra </option>
            <option value="Angola"> Angola </option>
            <option value="Anguilla"> Anguilla </option>
            <option value="Antigua and Barbuda"> Antigua and Barbuda </option>
            <option value="Argentina"> Argentina </option>
            <option value="Armenia"> Armenia </option>
            <option value="Aruba"> Aruba </option>
            <option value="Australia"> Australia </option>
            <option value="Austria"> Austria </option>
            <option value="Azerbaijan"> Azerbaijan </option>
            <option value="The Bahamas"> The Bahamas </option>
            <option value="Bahrain"> Bahrain </option>
            <option value="Bangladesh"> Bangladesh </option>
            <option value="Barbados"> Barbados </option>
            <option value="Belarus"> Belarus </option>
            <option value="Belgium"> Belgium </option>
            <option value="Belize"> Belize </option>
            <option value="Benin"> Benin </option>
            <option value="Bermuda"> Bermuda </option>
            <option value="Bhutan"> Bhutan </option>
            <option value="Bolivia"> Bolivia </option>
            <option value="Bosnia and Herzegovina"> Bosnia and Herzegovina </option>
            <option value="Botswana"> Botswana </option>
            <option value="Brazil"> Brazil </option>
            <option value="Brunei"> Brunei </option>
            <option value="Bulgaria"> Bulgaria </option>
            <option value="Burkina Faso"> Burkina Faso </option>
            <option value="Burundi"> Burundi </option>
            <option value="Cambodia"> Cambodia </option>
            <option value="Cameroon"> Cameroon </option>
            <option value="Canada"> Canada </option>
            <option value="Cape Verde"> Cape Verde </option>
            <option value="Cayman Islands"> Cayman Islands </option>
            <option value="Central African Republic"> Central African Republic </option>
            <option value="Chad"> Chad </option>
            <option value="Chile"> Chile </option>
            <option value="China"> China </option>
            <option value="Christmas Island"> Christmas Island </option>
            <option value="Cocos (Keeling) Islands"> Cocos (Keeling) Islands </option>
            <option value="Colombia"> Colombia </option>
            <option value="Comoros"> Comoros </option>
            <option value="Congo"> Congo </option>
            <option value="Cook Islands"> Cook Islands </option>
            <option value="Costa Rica"> Costa Rica </option>
            <option value="Cote d&#x27;Ivoire"> Cote d&#x27;Ivoire </option>
            <option value="Croatia"> Croatia </option>
            <option value="Cuba"> Cuba </option>
            <option value="Curacao"> Curacao </option>
            <option value="Cyprus"> Cyprus </option>
            <option value="Czech Republic"> Czech Republic </option>
            <option value="Democratic Republic of the Congo"> Democratic Republic of the Congo </option>
            <option value="Denmark"> Denmark </option>
            <option value="Djibouti"> Djibouti </option>
            <option value="Dominica"> Dominica </option>
            <option value="Dominican Republic"> Dominican Republic </option>
            <option value="Ecuador"> Ecuador </option>
            <option value="Egypt"> Egypt </option>
            <option value="El Salvador"> El Salvador </option>
            <option value="Equatorial Guinea"> Equatorial Guinea </option>
            <option value="Eritrea"> Eritrea </option>
            <option value="Estonia"> Estonia </option>
            <option value="Ethiopia"> Ethiopia </option>
            <option value="Falkland Islands"> Falkland Islands </option>
            <option value="Faroe Islands"> Faroe Islands </option>
            <option value="Fiji"> Fiji </option>
            <option value="Finland"> Finland </option>
            <option value="France"> France </option>
            <option value="French Polynesia"> French Polynesia </option>
            <option value="Gabon"> Gabon </option>
            <option value="The Gambia"> The Gambia </option>
            <option value="Georgia"> Georgia </option>
            <option value="Germany"> Germany </option>
            <option value="Ghana"> Ghana </option>
            <option value="Gibraltar"> Gibraltar </option>
            <option value="Greece"> Greece </option>
            <option value="Greenland"> Greenland </option>
            <option value="Grenada"> Grenada </option>
            <option value="Guadeloupe"> Guadeloupe </option>
            <option value="Guam"> Guam </option>
            <option value="Guatemala"> Guatemala </option>
            <option value="Guernsey"> Guernsey </option>
            <option value="Guinea"> Guinea </option>
            <option value="Guinea-Bissau"> Guinea-Bissau </option>
            <option value="Guyana"> Guyana </option>
            <option value="Haiti"> Haiti </option>
            <option value="Honduras"> Honduras </option>
            <option value="Hong Kong"> Hong Kong </option>
            <option value="Hungary"> Hungary </option>
            <option value="Iceland"> Iceland </option>
            <option value="India"> India </option>
            <option value="Indonesia"> Indonesia </option>
            <option value="Iran"> Iran </option>
            <option value="Iraq"> Iraq </option>
            <option value="Ireland"> Ireland </option>
            <option value="Israel"> Israel </option>
            <option value="Italy"> Italy </option>
            <option value="Jamaica"> Jamaica </option>
            <option value="Japan"> Japan </option>
            <option value="Jersey"> Jersey </option>
            <option value="Jordan"> Jordan </option>
            <option value="Kazakhstan"> Kazakhstan </option>
            <option value="Kenya"> Kenya </option>
            <option value="Kiribati"> Kiribati </option>
            <option value="North Korea"> North Korea </option>
            <option value="South Korea"> South Korea </option>
            <option value="Kosovo"> Kosovo </option>
            <option value="Kuwait"> Kuwait </option>
            <option value="Kyrgyzstan"> Kyrgyzstan </option>
            <option value="Laos"> Laos </option>
            <option value="Latvia"> Latvia </option>
            <option value="Lebanon"> Lebanon </option>
            <option value="Lesotho"> Lesotho </option>
            <option value="Liberia"> Liberia </option>
            <option value="Libya"> Libya </option>
            <option value="Liechtenstein"> Liechtenstein </option>
            <option value="Lithuania"> Lithuania </option>
            <option value="Luxembourg"> Luxembourg </option>
            <option value="Macau"> Macau </option>
            <option value="Macedonia"> Macedonia </option>
            <option value="Madagascar"> Madagascar </option>
            <option value="Malawi"> Malawi </option>
            <option value="Malaysia"> Malaysia </option>
            <option value="Maldives"> Maldives </option>
            <option value="Mali"> Mali </option>
            <option value="Malta"> Malta </option>
            <option value="Marshall Islands"> Marshall Islands </option>
            <option value="Martinique"> Martinique </option>
            <option value="Mauritania"> Mauritania </option>
            <option value="Mauritius"> Mauritius </option>
            <option value="Mayotte"> Mayotte </option>
            <option value="Mexico"> Mexico </option>
            <option value="Micronesia"> Micronesia </option>
            <option value="Moldova"> Moldova </option>
            <option value="Monaco"> Monaco </option>
            <option value="Mongolia"> Mongolia </option>
            <option value="Montenegro"> Montenegro </option>
            <option value="Montserrat"> Montserrat </option>
            <option value="Morocco"> Morocco </option>
            <option value="Mozambique"> Mozambique </option>
            <option value="Myanmar"> Myanmar </option>
            <option value="Nagorno-Karabakh"> Nagorno-Karabakh </option>
            <option value="Namibia"> Namibia </option>
            <option value="Nauru"> Nauru </option>
            <option value="Nepal"> Nepal </option>
            <option value="Netherlands"> Netherlands </option>
            <option value="Netherlands Antilles"> Netherlands Antilles </option>
            <option value="New Caledonia"> New Caledonia </option>
            <option value="New Zealand"> New Zealand </option>
            <option value="Nicaragua"> Nicaragua </option>
            <option value="Niger"> Niger </option>
            <option value="Nigeria"> Nigeria </option>
            <option value="Niue"> Niue </option>
            <option value="Norfolk Island"> Norfolk Island </option>
            <option value="Turkish Republic of Northern Cyprus"> Turkish Republic of Northern Cyprus </option>
            <option value="Northern Mariana"> Northern Mariana </option>
            <option value="Norway"> Norway </option>
            <option value="Oman"> Oman </option>
            <option value="Pakistan"> Pakistan </option>
            <option value="Palau"> Palau </option>
            <option value="Palestine"> Palestine </option>
            <option value="Panama"> Panama </option>
            <option value="Papua New Guinea"> Papua New Guinea </option>
            <option value="Paraguay"> Paraguay </option>
            <option value="Peru"> Peru </option>
            <option value="Philippines"> Philippines </option>
            <option value="Pitcairn Islands"> Pitcairn Islands </option>
            <option value="Poland"> Poland </option>
            <option value="Portugal"> Portugal </option>
            <option value="Puerto Rico"> Puerto Rico </option>
            <option value="Qatar"> Qatar </option>
            <option value="Republic of the Congo"> Republic of the Congo </option>
            <option value="Romania"> Romania </option>
            <option value="Russia"> Russia </option>
            <option value="Rwanda"> Rwanda </option>
            <option value="Saint Barthelemy"> Saint Barthelemy </option>
            <option value="Saint Helena"> Saint Helena </option>
            <option value="Saint Kitts and Nevis"> Saint Kitts and Nevis </option>
            <option value="Saint Lucia"> Saint Lucia </option>
            <option value="Saint Martin"> Saint Martin </option>
            <option value="Saint Pierre and Miquelon"> Saint Pierre and Miquelon </option>
            <option value="Saint Vincent and the Grenadines"> Saint Vincent and the Grenadines </option>
            <option value="Samoa"> Samoa </option>
            <option value="San Marino"> San Marino </option>
            <option value="Sao Tome and Principe"> Sao Tome and Principe </option>
            <option value="Saudi Arabia"> Saudi Arabia </option>
            <option value="Senegal"> Senegal </option>
            <option value="Serbia"> Serbia </option>
            <option value="Seychelles"> Seychelles </option>
            <option value="Sierra Leone"> Sierra Leone </option>
            <option value="Singapore"> Singapore </option>
            <option value="Slovakia"> Slovakia </option>
            <option value="Slovenia"> Slovenia </option>
            <option value="Solomon Islands"> Solomon Islands </option>
            <option value="Somalia"> Somalia </option>
            <option value="Somaliland"> Somaliland </option>
            <option value="South Africa"> South Africa </option>
            <option value="South Ossetia"> South Ossetia </option>
            <option value="South Sudan"> South Sudan </option>
            <option value="Spain"> Spain </option>
            <option value="Sri Lanka"> Sri Lanka </option>
            <option value="Sudan"> Sudan </option>
            <option value="Suriname"> Suriname </option>
            <option value="Svalbard"> Svalbard </option>
            <option value="eSwatini"> eSwatini </option>
            <option value="Sweden"> Sweden </option>
            <option value="Switzerland"> Switzerland </option>
            <option value="Syria"> Syria </option>
            <option value="Taiwan"> Taiwan </option>
            <option value="Tajikistan"> Tajikistan </option>
            <option value="Tanzania"> Tanzania </option>
            <option value="Thailand"> Thailand </option>
            <option value="Timor-Leste"> Timor-Leste </option>
            <option value="Togo"> Togo </option>
            <option value="Tokelau"> Tokelau </option>
            <option value="Tonga"> Tonga </option>
            <option value="Transnistria Pridnestrovie"> Transnistria Pridnestrovie </option>
            <option value="Trinidad and Tobago"> Trinidad and Tobago </option>
            <option value="Tristan da Cunha"> Tristan da Cunha </option>
            <option value="Tunisia"> Tunisia </option>
            <option value="Turkey"> Turkey </option>
            <option value="Turkmenistan"> Turkmenistan </option>
            <option value="Turks and Caicos Islands"> Turks and Caicos Islands </option>
            <option value="Tuvalu"> Tuvalu </option>
            <option value="Uganda"> Uganda </option>
            <option value="Ukraine"> Ukraine </option>
            <option value="United Arab Emirates"> United Arab Emirates </option>
            <option value="United Kingdom"> United Kingdom </option>
            <option value="Uruguay"> Uruguay </option>
            <option value="Uzbekistan"> Uzbekistan </option>
            <option value="Vanuatu"> Vanuatu </option>
            <option value="Vatican City"> Vatican City </option>
            <option value="Venezuela"> Venezuela </option>
            <option value="Vietnam"> Vietnam </option>
            <option value="British Virgin Islands"> British Virgin Islands </option>
            <option value="Isle of Man"> Isle of Man </option>
            <option value="US Virgin Islands"> US Virgin Islands </option>
            <option value="Wallis and Futuna"> Wallis and Futuna </option>
            <option value="Western Sahara"> Western Sahara </option>
            <option value="Yemen"> Yemen </option>
            <option value="Zambia"> Zambia </option>
            <option value="Zimbabwe"> Zimbabwe </option>
            <option value="other"> Other </option>
      </select><br />
    </div>
    <div>
        <label class="form-label form-label-top form-label-auto" id="label_19" for="input_19"> My Products: </label>
        <span class="form-sub-label-container " style="vertical-align:top">
              <label class="form-sub-label" for="input_19_quantity_1001_0" style="min-height:13px" aria-hidden="false"> Quantity </label>
              <select class="form-dropdown" name="myProductQuantity" id="myProductQuantity">
                <option value="1"> 1 </option>
                <option value="2"> 2 </option>
                <option value="3"> 3 </option>
                <option value="4"> 4 </option>
                <option value="5"> 5 </option>
                <option value="6"> 6 </option>
                <option value="7"> 7 </option>
                <option value="8"> 8 </option>
                <option value="9"> 9 </option>
                <option value="10"> 10 </option>
              </select>
         </span>
     </div>

     <div>
         <span class="form-product-details">
           <b>
             <span data-wrapper-react="true">
               $ {{ "%.2f"|format(price) }}
             </span>
           </b>
         </span>

         </div>

     <br/>

<!--              <span class="form-sub-label-container " style="vertical-align:top"> -->
<!--                    <label class="form-sub-label" for="input_19_custom_1001_2" style="min-height:13px" aria-hidden="false"> Clothe Size </label> -->
<!--                    <select class="form-dropdown" name="myProductSize" id="input_19_custom_1001_2"> -->
<!--                      <option value="XS"> XS </option> -->
<!--                      <option value="S"> S </option> -->
<!--                      <option value="M"> M </option> -->
<!--                      <option value="L"> L </option> -->
<!--                      <option value="XL"> XL </option> -->
<!--                      <option value="XXL"> XXL </option> -->
<!--                      <option value="XXXL"> XXXL </option> -->
<!--                    </select> -->
<!--              </span> -->
<!--              <span class="form-sub-label-container " style="vertical-align:top"> -->
<!--                <label class="form-sub-label" for="input_19_custom_1003_1" style="min-height:13px" aria-hidden="false"> Shoe Size </label> -->
<!--                <select class="form-dropdown" name="q19_myProducts[special_1003][item_1]" id="input_19_custom_1003_1"> -->
<!--                  <option value="8"> 8 </option> -->
<!--                  <option value="8.5"> 8.5 </option> -->
<!--                  <option value="9"> 9 </option> -->
<!--                  <option value="9.5"> 9.5 </option> -->
<!--                  <option value="10"> 10 </option> -->
<!--                  <option value="10.5"> 10.5 </option> -->
<!--                  <option value="11"> 11 </option> -->
<!--                  <option value="11.5"> 11.5 </option> -->
<!--                  <option value="12"> 12 </option> -->
<!--                  <option value="13"> 13 </option> -->
<!--                  <option value="14"> 14 </option> -->
<!--                </select> -->
<!--              </span> -->


        <label class="form-label form-label-top" id="label_20" for="input_20"> Payment Methods: </label>
        <div class="payment-method-container" data-id="paypal-card-fields">
            <select id="data_4" name="payment" style="width : 200px;" class="form-control">
                <option> choose payment method: </option>
                <option>1.Debit Card</option>
                <option>2.Credit Card</option>
            </select>
        </div>
<br/>
            <div>
              <p>Please click one of the PayPal options to complete payment and <b>submit</b> the form.</p>
            </div>
       <br />
        <div id="cid_13" class="form-input-wide">
          <div style="text-align:center" data-align="center" class="form-buttons-wrapper form-buttons-center   jsTest-button-wrapperField">
           <input name="submit" value=" Submit Order:" type="submit" class="btn btn-success" />
           <a href="/clothing_products/index/" class="btn btn-danger">Return to Home Page</a></div>
          </div>
        </div>
  </div>
