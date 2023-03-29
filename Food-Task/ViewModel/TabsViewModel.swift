//
//  TabViewModel.swift
//  Food-Task
//
//  Created by Mina Mohareb on 28/03/2023.
//

import Foundation



class TabsViewModel : ObservableObject{
    
    @Published var isShopLoad = false
    @Published var isDiscountShapeLoad = false
    @Published var isGalleryLoad = false
    @Published var isProfileLoad = false
    
    init() {
        
        // load initial data
        print("Home Data Loaded")
    }
    
    func loadShop(){
        
        print("Shop Loaded")
        isShopLoad = true
    }
    
    func loadDiscountShape(){
        
        print("DiscountShape Loaded")
        isDiscountShapeLoad = true
    }
    
    func loadGallery(){
        
        print("Gallery Loaded")
        isGalleryLoad = true
    }
    func loadProfile()
    {
        print("Profile Loaded")
        isProfileLoad = true
    }
}

var tabs = ["home-2","shop","discount-shape","gallery","profile"]
