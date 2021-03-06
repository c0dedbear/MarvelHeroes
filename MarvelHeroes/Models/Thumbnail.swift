//
//  Thumbnail.swift
//  MarvelHeroes
//
//  Created by Mikhail Medvedev on 01.12.2019.
//  Copyright © 2019 Mikhail Medvedev. All rights reserved.
//

import UIKit

struct Thumbnail: Decodable
{
	let path: String
	let thumbnailExtension: String

	enum CodingKeys: String, CodingKey
	{
		case path
		case thumbnailExtension = "extension"
	}

	static let placeholder: UIImage = #imageLiteral(resourceName: "placeholder")
}
