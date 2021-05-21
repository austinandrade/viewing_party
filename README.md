<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/austinandrade/viewing_party/blob/main/public/Viewing%20Party.png">
    <img src="public/Viewing Party.png" alt="Logo" width="550" height="475">
  </a>
</p>



<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

Have you missed hanging out with your friends during quarantine and want a way to schedule get-to-gethers to watch some movies? Viewing party is an application in where you can explore movie options and create a viewing party event for yourself and your friends. Create a viewing party for *any* movie found in the MoviesDB!

## Accomplishments

* Construct a CRUD application utilizing MVC and RESTful methodologies 
* Store viewing party and user account creation data via a PostgreSQL database
* Encrypt user passwords via Bcrypt  
* Consume JSON APIs via MoviesDB authenticated endpoints 
* Enforce user authentication via session cookies 
* Lint code via RuboCop for readability and convention
* Analyze integration using Travis CI

### Built With

* [TravisCI](https://travis-ci.org/)
* [RubyOnRails](https://rubyonrails.org/)
* [Webmock](https://github.com/bblimke/webmock)
* [RuboCop](https://github.com/rubocop/rubocop)
* [Figaro](https://github.com/laserlemon/figaro)


## Versions

- Ruby 2.5.3

- Rails 5.2.5

<!-- GETTING STARTED -->


### Prerequisites

Install bundler for all necessary gem installation:
* Bundler

  ```sh
  gem install bundler
  ```
  
## Getting Started

1. Fork the repo
2. Clone the repo

   ```sh
   git clone https://github.com/your_username_/viewing_party.git
   ```
3. Install gem packages: `bundle install`
4. Setup the database: `rails db:{create,migrate}`


### Installation

1. Get a free MoviesDB API Key at [MoviesDB](https://developers.themoviedb.org/4/getting-started/authorization)
2. Install Figaro

  ```sh
   bundle exec figaro install
   ```
4. Enter your API in `config/application.yml`

   ```sh
   TMD_api_key: 'YOUR API KEY HERE'
   ```

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request



<!-- LICENSE -->
## License

Distributed under the MoviesDB License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

Austin Andrade - [LinkedIn](https://www.linkedin.com/in/austinandrade/) - austinmandrade@gmail.com

[Mike Foy](https://github.com/foymikek) - [LinkedIn](https://www.linkedin.com/in/michael-foy-707ba7b4/) - foymikek@gmail.com


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=for-the-badge
[contributors-url]: https://github.com/othneildrew/Best-README-Template/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/othneildrew/Best-README-Template.svg?style=for-the-badge
[forks-url]: https://github.com/othneildrew/Best-README-Template/network/members
[stars-shield]: https://img.shields.io/github/stars/othneildrew/Best-README-Template.svg?style=for-the-badge
[stars-url]: https://github.com/othneildrew/Best-README-Template/stargazers
[issues-shield]: https://img.shields.io/github/issues/othneildrew/Best-README-Template.svg?style=for-the-badge
[issues-url]: https://github.com/othneildrew/Best-README-Template/issues
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=for-the-badge
[license-url]: https://github.com/othneildrew/Best-README-Template/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/othneildrew
[product-screenshot]: images/screenshot.png
