//
//  AuthService.swift
//  FYP 1.0.3
//
//  Created by Peadar Conaghan on 21/03/2021.
//

import UIKit
import Amplify
import AmplifyPlugins

class AuthService {
    static let shared = AuthService()
    private init(){}
    
    //Register
    func signUp(username: String, password: String, email: String) {
        let userAttributes = [AuthUserAttribute(.email, value: email)]
        let options = AuthSignUpRequest.Options(userAttributes: userAttributes)
        Amplify.Auth.signUp(username: username, password: password, options: options) { result in
            switch result {
            case .success(let signUpResult):
                if case let .confirmUser(deliveryDetails, _) = signUpResult.nextStep {
                    print("Delivery details \(String(describing: deliveryDetails))")
                } else {
                    print("SignUp Complete")
                    self.fetchCurrentAuthSession()
                }
            case .failure(let error):
                print("An error occurred while registering a user \(error)")
            }
        }
    }
    
    //SignIn
    func signIn(username: String, password: String) {
        Amplify.Auth.signIn(username: username, password: password) { result in
            switch result {
            case .success:
                print("Sign in succeeded")
                self.fetchCurrentAuthSession()
            case .failure(let error):
                print("Sign in failed \(error)")
            }
        }
    }
    
    //SignOut
    func signOutLocally() {
        Amplify.Auth.signOut() { result in
            switch result {
            case .success:
                print("Successfully signed out")
                self.fetchCurrentAuthSession()
            case .failure(let error):
                print("Sign out failed with error \(error)")
            }
        }
    }
    
    
    
    func fetchCurrentAuthSession() {
        _ = Amplify.Auth.fetchAuthSession { result in
            switch result {
            case .success(let session):
                print("Is user signed in - \(session.isSignedIn)")
            case .failure(let error):
                print("Fetch session failed with error \(error)")
            }
        }
    }
    
    
}
