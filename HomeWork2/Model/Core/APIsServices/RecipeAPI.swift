//
// RecipeAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
import OtusNetWork

protocol IRecipeApiService {
    
    func getRecipe(type: RecipesSearchType, p: Int?, completion: @escaping ((_ data: RecipeList?,_ error: Error?) -> Void))
}

open class RecipeAPI: IRecipeApiService {
    
    /// i: (query) Ingredient, p: (query) Paging (optional)
    func getRecipe(type: RecipesSearchType, p: Int?, completion: @escaping ((_ data: RecipeList?,_ error: Error?) -> Void)) {
        self.getRecipeWithRequestBuilder(i: type.searchText, p: p).execute(OpenAPIClientAPI.apiResponseQueue) { result -> Void in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }
    
    /// i: (query) Ingredient, p: (query) Paging (optional)
    func getRecipeWithRequestBuilder(i: String, p: Int? = nil) -> RequestBuilder<RecipeList> {
        let path = "/api/"
        let URLString = OpenAPIClientAPI.recepiesBasePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "i": i.encodeToJSON(),
            "p": p?.encodeToJSON()
        ])

        let requestBuilder: RequestBuilder<RecipeList>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}