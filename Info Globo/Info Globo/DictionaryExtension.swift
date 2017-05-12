//
//  DictionaryExtension.swift
//  Info Globo
//
//  Created by Fabio Miciano on 11/05/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

extension Dictionary where Key: ExpressibleByStringLiteral, Value: Any {
    
    var authTokenKey: String? {
        return self["key"] as? String
    }
    
    var detailKey: String? {
        return self["detail"] as? String
    }
    
    var nonFieldErrosKey: [String]? {
        return self["non_field_errors"] as? [String]
    }
    
    var tokenKey: String? {
        return self["token"] as? String
    }
    
    var emailKey: String? {
        return self["email"] as? String
    }
    
    var erroKey: Bool? {
        return self["erro"] as? Bool
    }
    
    var urlKey: String? {
        return self["url"] as? String
    }
    
    var userKey: Int? {
        return self["user"] as? Int
    }
    
    var userURLKey: String? {
        return self["user"] as? String
    }
    
    var countKey: Int? {
        return self["count"] as? Int
    }
    
    var nextKey: String? {
        return self["next"] as? String
    }
    
    var previousKey: String? {
        return self["previous"] as? String
    }
    
    var resultsKey: [[String: Any]]? {
        return self["results"] as? [[String: Any]]
    }
    
    var jobURLKey: String? {
        return self["diligencia"] as? String
    }
    
    //PRAGMA MARK: -- ENDERECO --
    var cepKey: String? {
        return self["cep"] as? String
    }
    
    var streetKey: String? {
        return self["logradouro"] as? String
    }
    
    var complementKey: String? {
        return self["complemento"] as? String
    }
    
    var bairroKey: String? {
        return self["bairro"] as? String
    }
    
    var localidadeKey: String? {
        return self["localidade"] as? String
    }
    
    var ufKey: String? {
        return self["uf"] as? String
    }
    
    //PRAGMA MARK: -- ERRO 400 NA SEGUNDA ETAPA DE CADASTRO --
    var personalInfosError: [String]? {
        if let cpf = self["cpf_cnpj"] as? [String] {
            return cpf
        }
        if let phone = self["phones"] as? [String] {
            return phone
        }
        if let oab = self["oab"] as? [String] {
            return oab
        }
        if let seccional = self["oab_uf"] as? [String] {
            return seccional
        }
        
        return nil
    }
    
    //PRAGMA MARK: -- ERRO 400 NA TERCEIRA ETAPA DE CADASTRO --
    var addressInfosError: [String]? {
        
        if let address = self["address"] as? [String] {
            return address
        }
        if let complement = self["address_extra"] as? [String] {
            return complement
        }
        if let neighborhood = self["neighborhood"] as? [String] {
            return neighborhood
        }
        if let city = self["city"] as? [String] {
            return city
        }
        if let cep = self["zipcode"] as? [String] {
            return cep
        }
        
        return nil
    }
    
    //PRAGMA MARK: -- PROFILE --
    
    var fistNameKey: String? {
        return self["first_name"] as? String
    }
    
    var lastNameKey: String? {
        return self["last_name"] as? String
    }
    
    var userNameKey: String? {
        return self["username"] as? String
    }
    
    var birthdayKey: String? {
        return self["birthday"] as? String
    }
    
    var bankCodeKey: String? {
        return self["bank_code"] as? String
    }
    
    var bankAgencyKey: String? {
        return self["bank_agency"] as? String
    }
    
    var bankAccountKey: String? {
        return self["bank_account"] as? String
    }
    
    var profileTypeKey: String? {
        return self["profile_type"] as? String
    }
    
    var cpfKey: String? {
        return self["cpf_cnpj"] as? String
    }
    
    var oabKey: String? {
        return self["oab"] as? String
    }
    
    var oabSeccionalKey: String? {
        return self["oab_uf"] as? String
    }
    
    var oabVerifiedKey: Bool? {
        return self["oab_verified"] as? Bool
    }
    
    var officeCNPJKey: String? {
        return self["office_cnpj"] as? String
    }
    
    var officeNameKey: String? {
        return self["office_name"] as? String
    }
    
    var officeWebSiteKey: String? {
        return self["office_website"] as? String
    }
    
    var photoKey: String? {
        return self["photo"] as? String
    }
    
    var pkKey: String? {
        return self["pk"] as? String
    }
    
    var phonesKey: [[String: Any]]? {
        return self["phones"] as? [[String: Any]]
    }
    
    var addressKey: String? {
        return self["address"] as? String
    }
    
    var addresExtraKey: String? {
        return self["address_extra"] as? String
    }
    
    var neighborhoodKey: String? {
        return self["neighborhood"] as? String
    }
    
    var cityKey: String? {
        return self["city"] as? String
    }
    
    var cityNameKey: String? {
        return self["city_name"] as? String
    }
    
    var cityStateNameKey: String? {
        return self["city_state_name"] as? String
    }
    
    var zipCodeKey: String? {
        return self["zipcode"] as? String
    }
    
    var zipCodeValidatedKey: Bool? {
        return self["zipcode_validated"] as? Bool
    }
    
    var countJobsKey: Int? {
        return self["count_diligencias"] as? Int
    }
    
    var countCompleteApplicationsKey: Int? {
        return self["count_completed_applications"] as? Int
    }
    
    var isPremiumKey: Bool? {
        return self["is_premium"] as? Bool
    }
    
    //PRAGMA MARK: -- PHONES --
    
    var profileKey: Int? {
        return self["profile"] as? Int
    }
    
    var strKey: String? {
        return self["__str__"] as? String
    }
    
    var numberKey: String? {
        return self["number"] as? String
    }
    
    var titleKey: String? {
        return self["title"] as? String
    }
    
    var whatsappKey: Bool? {
        return self["whatsapp"] as? Bool
    }
    
    //PRAGMA MARK: -- USER --
    
    var urlProfileKey: String? {
        return self["url_profile"] as? String
    }
    
    var urlReviewsKey: String? {
        return self["reviews"] as? String
    }
    
    var avarengeRatingsKey: Float? {
        return self["average_ratings"] as? Float
    }
    
    //PRAGMA MARK: -- SETTINGS --
    
    var notificationEmailKey: Bool? {
        return self["notification_email"] as? Bool
    }
    
    var notificationPushKey: Bool? {
        return self["notification_push"] as? Bool
    }
    
    //PRAGMA MARK: -- REVIEWS --
    
    var commentKey: String? {
        return self["comment"] as? String
    }
    
    var ratedAtKey: String? {
        return self["rated_at"] as? String
    }
    
    var ratedUserKey: String? {
        return self["rated_user"] as? String
    }
    
    var ratingKey: Int? {
        return self["rating"] as? Int
    }
    
    var userRoleKey: String? {
        return self["user_role"] as? String
    }
    
    var userProfileKey: [String: Any]? {
        return self["user_profile"] as? [String: Any]
    }
    
    var nameKey: String? {
        return self["name"] as? String
    }
    
}
