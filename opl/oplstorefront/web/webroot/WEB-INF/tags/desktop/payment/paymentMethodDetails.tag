<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/desktop/template"%>
<%@ taglib prefix="theme" tagdir="/WEB-INF/tags/shared/theme"%>
<%@ taglib prefix="formElement"
	tagdir="/WEB-INF/tags/desktop/formElement"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ycommerce" uri="/WEB-INF/tld/ycommercetags.tld"%>
<%@ taglib prefix="multi-checkout"
	tagdir="/WEB-INF/tags/desktop/checkout/multi"%>

<div class="payment_details_left_col">
	<h1>
		<spring:theme
			code="checkout.multi.paymentMethod.addPaymentDetails.paymentCard" />
	</h1>

	<p>
		<spring:theme
			code="checkout.multi.paymentMethod.addPaymentDetails.enterYourCardDetails" />
	</p>

	<p>
		<spring:theme code="form.required" />
	</p>
	<dl>
		<form:hidden path="paymentId" class="create_update_payment_id" />
		<formElement:formSelectBox idKey="payment.cardType"
			labelKey="payment.cardType" path="cardTypeCode" mandatory="true"
			skipBlank="false" skipBlankMessageKey="payment.cardType.pleaseSelect"
			items="${cardTypes}" tabindex="1" />
		<formElement:formInputBox idKey="payment.nameOnCard"
			labelKey="payment.nameOnCard" path="nameOnCard" inputCSS="text"
			mandatory="true" tabindex="2" />
		<formElement:formInputBox idKey="payment.cardNumber"
			labelKey="payment.cardNumber" path="cardNumber" inputCSS="text"
			mandatory="true" tabindex="3" />

		<template:errorSpanField path="startMonth">
			<dt>
				<label for="StartMonth"><spring:theme
						code="payment.startDate" /></label>
			</dt>
			<dd>
				<form:select id="StartMonth" path="startMonth" cssClass="card_date"
					tabindex="4">
					<option value="" label="<spring:theme code='payment.month'/>" />
					<form:options items="${months}" itemValue="code" itemLabel="name" />
				</form:select>

				<form:select id="StartYear" path="startYear" cssClass="card_date"
					tabindex="5">
					<option value="" label="<spring:theme code='payment.year'/>" />
					<form:options items="${startYears}" itemValue="code"
						itemLabel="name" />
				</form:select>
			</dd>

			<dt>
				<label for="ExpiryMonth"><spring:theme
						code="payment.expiryDate" /></label>
			</dt>
			<dd>
				<template:errorSpanField path="expiryMonth">
					<form:select id="ExpiryMonth" path="expiryMonth"
						cssClass="card_date" tabindex="6">
						<option value="" label="<spring:theme code='payment.month'/>" />
						<form:options items="${months}" itemValue="code" itemLabel="name" />
					</form:select>
				</template:errorSpanField>

				<template:errorSpanField path="expiryYear">
					<form:select id="ExpiryYear" path="expiryYear" cssClass="card_date"
						tabindex="7">
						<option value="" label="<spring:theme code='payment.year'/>" />
						<form:options items="${expiryYears}" itemValue="code"
							itemLabel="name" />
					</form:select>
				</template:errorSpanField>
			</dd>
		</template:errorSpanField>

		<formElement:formInputBox idKey="payment.issueNumber"
			labelKey="payment.issueNumber" path="issueNumber" inputCSS="text"
			mandatory="false" tabindex="8" />
	</dl>
</div>

<div class="payment_details_right_col">

	<h1>
		<spring:theme code="checkout.multi.paymentMethod.addPaymentDetails.billingAddress" />
	</h1>
	<p>
		<spring:theme code="checkout.multi.paymentMethod.addPaymentDetails.billingAddressDiffersFromDeliveryAddress" />
	</p>
	<dl>
		<dt class="left">
			<form:checkbox id="differentAddress" path="newBillingAddress" tabindex="9" />
			<label for="differentAddress"><spring:theme code="checkout.multi.paymentMethod.addPaymentDetails.enterDifferentBillingAddress" /></label>
		</dt>
		<dd></dd>
	</dl>

	<p>
		<spring:theme code="form.required" />
	</p>
	<dl id="newBillingAddressFields">
		<form:hidden path="billingAddress.addressId"
			class="create_update_address_id" />
		<formElement:formSelectBox idKey="address.title"
			labelKey="address.title" path="billingAddress.titleCode"
			mandatory="true" skipBlank="false"
			skipBlankMessageKey="address.title.pleaseSelect" items="${titles}"
			tabindex="10" />
		<formElement:formInputBox idKey="address.firstName"
			labelKey="address.firstName" path="billingAddress.firstName"
			inputCSS="text" mandatory="true" tabindex="11" />
		<formElement:formInputBox idKey="address.surname"
			labelKey="address.surname" path="billingAddress.lastName"
			inputCSS="text" mandatory="true" tabindex="12" />
		<formElement:formInputBox idKey="address.line1"
			labelKey="address.line1" path="billingAddress.line1" inputCSS="text"
			mandatory="true" tabindex="13" />
		<formElement:formInputBox idKey="address.line2"
			labelKey="address.line2" path="billingAddress.line2" inputCSS="text"
			mandatory="false" tabindex="14" />
		<formElement:formInputBox idKey="address.townCity"
			labelKey="address.townCity" path="billingAddress.townCity"
			inputCSS="text" mandatory="true" tabindex="15" />
		<formElement:formInputBox idKey="address.postcode"
			labelKey="address.postcode" path="billingAddress.postcode"
			inputCSS="text" mandatory="true" tabindex="16" />
		<formElement:formSelectBox idKey="address.country"
			labelKey="address.country" path="billingAddress.countryIso"
			mandatory="true" skipBlank="false"
			skipBlankMessageKey="address.selectCountry"
			items="${billingCountries}" itemValue="isocode" tabindex="17" />
		<form:hidden path="billingAddress.shippingAddress" />
		<form:hidden path="billingAddress.billingAddress" />
	</dl>
</div>
<div class="save_payment_details">
	<dl>
		<dt class="left">
			<form:checkbox id="SaveDetails" path="saveInAccount" tabindex="18" />
			<label for="SaveDetails"><spring:theme
					code="checkout.multi.paymentMethod.addPaymentDetails.savePaymentDetailsInAccount" /></label>
		</dt>
		<dd></dd>
	</dl>
	<div style="clear: both;">
		<ycommerce:testId code="editPaymentMethod_savePaymentMethod_button">
			<button class="positive" tabindex="19" id="lastInTheForm">
				<spring:theme
					code="checkout.multi.paymentMethod.addPaymentDetails.useThesePaymentDetails" />
			</button>
		</ycommerce:testId>

		<button class="r_action_btn right" style="margin-right: 10px;" type="button"
			onclick="window.location='${choosePaymentMethodUrl}'">
			<spring:theme code="checkout.multi.cancel" text="Cancel" />
		</button>
	</div>
</div>
