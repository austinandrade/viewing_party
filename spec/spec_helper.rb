# This file was generated by the `rails generate rspec:install` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# The generated `.rspec` file contains `--require spec_helper` which will cause
# this file to always be loaded, without a need to explicitly require it in any
# files.
#
# Given that it is always loaded, you are encouraged to keep this file as
# light-weight as possible. Requiring heavyweight dependencies from this file
# will add to the boot time of your test suite on EVERY test run, even for an
# individual file that may not need all of that loaded. Instead, consider making
# a separate helper file that requires the additional dependencies and performs
# the additional setup, and require it from the spec files that actually need
# it.
#
require 'simplecov'
require 'webmock/rspec'
SimpleCov.start 'rails'
SimpleCov.add_filter ['spec', 'config']
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    #     be_bigger_than(2).and_smaller_than(4).description
    #     # => "be bigger than 2 and smaller than 4"
    # ...rather than:
    #     # => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

  # This option will default to `:apply_to_host_groups` in RSpec 4 (and will
  # have no way to turn it off -- the option exists only for backwards
  # compatibility in RSpec 3). It causes shared context metadata to be
  # inherited by the metadata hash of host groups and examples, rather than
  # triggering implicit auto-inclusion in groups with matching metadata.
  config.shared_context_metadata_behavior = :apply_to_host_groups

# The settings below are suggested to provide a good initial experience
# with RSpec, but feel free to customize to your heart's content.
=begin
  # This allows you to limit a spec run to individual examples or groups
  # you care about by tagging them with `:focus` metadata. When nothing
  # is tagged with `:focus`, all examples get run. RSpec also provides
  # aliases for `it`, `describe`, and `context` that include `:focus`
  # metadata: `fit`, `fdescribe` and `fcontext`, respectively.
  config.filter_run_when_matching :focus

  # Allows RSpec to persist some state between runs in order to support
  # the `--only-failures` and `--next-failure` CLI options. We recommend
  # you configure your source control system to ignore this file.
  config.example_status_persistence_file_path = "spec/examples.txt"

  # Limits the available syntax to the non-monkey patched syntax that is
  # recommended. For more details, see:
  #   - http://rspec.info/blog/2012/06/rspecs-new-expectation-syntax/
  #   - http://www.teaisaweso.me/blog/2013/05/27/rspecs-new-message-expectation-syntax/
  #   - http://rspec.info/blog/2014/05/notable-changes-in-rspec-3/#zero-monkey-patching-mode
  config.disable_monkey_patching!

  # Many RSpec users commonly either run the entire suite or an individual
  # file, and it's useful to allow more verbose output when running an
  # individual spec file.
  if config.files_to_run.one?
    # Use the documentation formatter for detailed output,
    # unless a formatter has already been configured
    # (e.g. via a command-line flag).
    config.default_formatter = "doc"
  end

  # Print the 10 slowest examples and example groups at the
  # end of the spec run, to help surface which specs are running
  # particularly slow.
  config.profile_examples = 10

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = :random

  # Seed global randomization in this process using the `--seed` CLI option.
  # Setting this allows you to use `--seed` to deterministically reproduce
  # test failures related to randomization by passing the same `--seed` value
  # as the one that triggered the failure.
  Kernel.srand config.seed
=end
end

def movie_service_json
  {
    "page": 1,
    "results": [
        {
            "adult": false,
            "backdrop_path": "/gNBCvtYyGPbjPCT1k3MvJuNuXR6.jpg",
            "genre_ids": [
                35,
                18,
                10749
            ],
            "id": 19404,
            "original_language": "hi",
            "original_title": "दिलवाले दुल्हनिया ले जायेंगे",
            "overview": "Raj is a rich, carefree, happy-go-lucky second generation NRI. Simran is the daughter of Chaudhary Baldev Singh, who in spite of being an NRI is very strict about adherence to Indian values. Simran has left for India to be married to her childhood fiancé. Raj leaves for India with a mission at his hands, to claim his lady love under the noses of her whole family. Thus begins a saga.",
            "popularity": 14.327,
            "poster_path": "/2CAL2433ZeIihfX1Hb2139CX0pW.jpg",
            "release_date": "1995-10-20",
            "title": "Dilwale Dulhania Le Jayenge",
            "video": false,
            "vote_average": 8.7,
            "vote_count": 2865
        },
        {
            "adult": false,
            "backdrop_path": "/iNh3BivHyg5sQRPP1KOkzguEX0H.jpg",
            "genre_ids": [
                18,
                80
            ],
            "id": 278,
            "original_language": "en",
            "original_title": "The Shawshank Redemption",
            "overview": "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
            "popularity": 47.01,
            "poster_path": "/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
            "release_date": "1994-09-23",
            "title": "The Shawshank Redemption",
            "video": false,
            "vote_average": 8.7,
            "vote_count": 18918
        },
        {
            "adult": false,
            "backdrop_path": "/jtAI6OJIWLWiRItNSZoWjrsUtmi.jpg",
            "genre_ids": [
                10749
            ],
            "id": 724089,
            "original_language": "en",
            "original_title": "Gabriel's Inferno Part II",
            "overview": "Professor Gabriel Emerson finally learns the truth about Julia Mitchell's identity, but his realization comes a moment too late. Julia is done waiting for the well-respected Dante specialist to remember her and wants nothing more to do with him. Can Gabriel win back her heart before she finds love in another's arms?",
            "popularity": 7.097,
            "poster_path": "/x5o8cLZfEXMoZczTYWLrUo1P7UJ.jpg",
            "release_date": "2020-07-31",
            "title": "Gabriel's Inferno Part II",
            "video": false,
            "vote_average": 8.7,
            "vote_count": 1251
        },
        {
            "adult": false,
            "backdrop_path": "/rSPw7tgCH9c6NqICZef4kZjFOQ5.jpg",
            "genre_ids": [
                18,
                80
            ],
            "id": 238,
            "original_language": "en",
            "original_title": "The Godfather",
            "overview": "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.",
            "popularity": 37.957,
            "poster_path": "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
            "release_date": "1972-03-14",
            "title": "The Godfather",
            "video": false,
            "vote_average": 8.7,
            "vote_count": 14270
        },
        {
            "adult": false,
            "backdrop_path": "/fQq1FWp1rC89xDrRMuyFJdFUdMd.jpg",
            "genre_ids": [
                10749,
                35
            ],
            "id": 761053,
            "original_language": "en",
            "original_title": "Gabriel's Inferno Part III",
            "overview": "The final part of the film adaption of the erotic romance novel Gabriel's Inferno written by an anonymous Canadian author under the pen name Sylvain Reynard.",
            "popularity": 18.889,
            "poster_path": "/fYtHxTxlhzD4QWfEbrC1rypysSD.jpg",
            "release_date": "2020-11-19",
            "title": "Gabriel's Inferno Part III",
            "video": false,
            "vote_average": 8.7,
            "vote_count": 811
        },
        {
            "adult": false,
            "backdrop_path": "/w2uGvCpMtvRqZg6waC1hvLyZoJa.jpg",
            "genre_ids": [
                10749
            ],
            "id": 696374,
            "original_language": "en",
            "original_title": "Gabriel's Inferno",
            "overview": "An intriguing and sinful exploration of seduction, forbidden love, and redemption, Gabriel's Inferno is a captivating and wildly passionate tale of one man's escape from his own personal hell as he tries to earn the impossible--forgiveness and love.",
            "popularity": 9.393,
            "poster_path": "/oyG9TL7FcRP4EZ9Vid6uKzwdndz.jpg",
            "release_date": "2020-05-29",
            "title": "Gabriel's Inferno",
            "video": false,
            "vote_average": 8.7,
            "vote_count": 2036
        },
        {
            "adult": false,
            "backdrop_path": "/loRmRzQXZeqG78TqZuyvSlEQfZb.jpg",
            "genre_ids": [
                18,
                36,
                10752
            ],
            "id": 424,
            "original_language": "en",
            "original_title": "Schindler's List",
            "overview": "The true story of how businessman Oskar Schindler saved over a thousand Jewish lives from the Nazis while they worked as slaves in his factory during World War II.",
            "popularity": 31.322,
            "poster_path": "/sF1U4EUQS8YHUYjNl3pMGNIQyr0.jpg",
            "release_date": "1993-11-30",
            "title": "Schindler's List",
            "video": false,
            "vote_average": 8.6,
            "vote_count": 11374
        },
        {
            "adult": false,
            "backdrop_path": "/poec6RqOKY9iSiIUmfyfPfiLtvB.jpg",
            "genre_ids": [
                18,
                80
            ],
            "id": 240,
            "original_language": "en",
            "original_title": "The Godfather: Part II",
            "overview": "In the continuing saga of the Corleone crime family, a young Vito Corleone grows up in Sicily and in 1910s New York. In the 1950s, Michael Corleone attempts to expand the family business into Las Vegas, Hollywood and Cuba.",
            "popularity": 31.215,
            "poster_path": "/hek3koDUyRQk7FIhPXsa6mT2Zc3.jpg",
            "release_date": "1974-12-20",
            "title": "The Godfather: Part II",
            "video": false,
            "vote_average": 8.6,
            "vote_count": 8515
        },
        {
            "adult": false,
            "backdrop_path": "/dIWwZW7dJJtqC6CgWzYkNVKIUm8.jpg",
            "genre_ids": [
                10749,
                16,
                18
            ],
            "id": 372058,
            "original_language": "ja",
            "original_title": "君の名は。",
            "overview": "High schoolers Mitsuha and Taki are complete strangers living separate lives. But one night, they suddenly switch places. Mitsuha wakes up in Taki’s body, and he in hers. This bizarre occurrence continues to happen randomly, and the two must adjust their lives around each other.",
            "popularity": 92.634,
            "poster_path": "/q719jXXEzOoYaps6babgKnONONX.jpg",
            "release_date": "2016-08-26",
            "title": "Your Name.",
            "video": false,
            "vote_average": 8.6,
            "vote_count": 7439
        },
        {
            "adult": false,
            "backdrop_path": "/Ab8mkHmkYADjU7wQiOkia9BzGvS.jpg",
            "genre_ids": [
                16,
                10751,
                14
            ],
            "id": 129,
            "original_language": "ja",
            "original_title": "千と千尋の神隠し",
            "overview": "A young girl, Chihiro, becomes trapped in a strange new world of spirits. When her parents undergo a mysterious transformation, she must call upon the courage she never knew she had to free her family.",
            "popularity": 47.901,
            "poster_path": "/39wmItIWsg5sZMyRUHLkWBcuVCM.jpg",
            "release_date": "2001-07-20",
            "title": "Spirited Away",
            "video": false,
            "vote_average": 8.5,
            "vote_count": 11330
        },
        {
            "adult": false,
            "backdrop_path": "/TU9NIjwzjoKPwQHoHshkFcQUCG.jpg",
            "genre_ids": [
                35,
                53,
                18
            ],
            "id": 496243,
            "original_language": "ko",
            "original_title": "기생충",
            "overview": "All unemployed, Ki-taek's family takes peculiar interest in the wealthy and glamorous Parks for their livelihood until they get entangled in an unexpected incident.",
            "popularity": 116.861,
            "poster_path": "/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg",
            "release_date": "2019-05-30",
            "title": "Parasite",
            "video": false,
            "vote_average": 8.5,
            "vote_count": 11352
        },
        {
            "adult": false,
            "backdrop_path": "/yeJhRNtE4XW2lOoVVFO9iuDr3AL.jpg",
            "genre_ids": [
                10751,
                12,
                16,
                14
            ],
            "id": 441130,
            "original_language": "en",
            "original_title": "Wolfwalkers",
            "overview": "In a time of superstition and magic, when wolves are seen as demonic and nature an evil to be tamed, a young apprentice hunter comes to Ireland with her father to wipe out the last pack. But when she saves a wild native girl, their friendship leads her to discover the world of the Wolfwalkers and transform her into the very thing her father is tasked to destroy.",
            "popularity": 14.567,
            "poster_path": "/ehAKuE48okTuonq6TpsNQj8vFTC.jpg",
            "release_date": "2020-10-26",
            "title": "Wolfwalkers",
            "video": false,
            "vote_average": 8.5,
            "vote_count": 449
        },
        {
            "adult": false,
            "backdrop_path": "/xMIyotorUv2Yz7zpQz2QYc8wkWB.jpg",
            "genre_ids": [
                14,
                18,
                80
            ],
            "id": 497,
            "original_language": "en",
            "original_title": "The Green Mile",
            "overview": "A supernatural tale set on death row in a Southern prison, where gentle giant John Coffey possesses the mysterious power to heal people's ailments. When the cell block's head guard, Paul Edgecomb, recognizes Coffey's miraculous gift, he tries desperately to help stave off the condemned man's execution.",
            "popularity": 42.898,
            "poster_path": "/velWPhVMQeQKcxggNEU8YmIo52R.jpg",
            "release_date": "1999-12-10",
            "title": "The Green Mile",
            "video": false,
            "vote_average": 8.5,
            "vote_count": 12246
        },
        {
            "adult": false,
            "backdrop_path": "/88J6waYVTta8Qz3iX3qUeWNA5d5.jpg",
            "genre_ids": [
                18,
                10749
            ],
            "id": 447362,
            "original_language": "en",
            "original_title": "Life in a Year",
            "overview": "A 17 year old finds out that his girlfriend is dying, so he sets out to give her an entire life, in the last year she has left.",
            "popularity": 101.606,
            "poster_path": "/7EuZIYEHLTu1G69maFLwg13u5iB.jpg",
            "release_date": "2020-11-27",
            "title": "Life in a Year",
            "video": false,
            "vote_average": 8.5,
            "vote_count": 571
        },
        {
            "adult": false,
            "backdrop_path": "/pcDc2WJAYGJTTvRSEIpRZwM3Ola.jpg",
            "genre_ids": [
                28,
                12,
                14,
                878
            ],
            "id": 791373,
            "original_language": "en",
            "original_title": "Zack Snyder's Justice League",
            "overview": "Determined to ensure Superman's ultimate sacrifice was not in vain, Bruce Wayne aligns forces with Diana Prince with plans to recruit a team of metahumans to protect the world from an approaching threat of catastrophic proportions.",
            "popularity": 1212.357,
            "poster_path": "/tnAuB8q5vv7Ax9UAEje5Xi4BXik.jpg",
            "release_date": "2021-03-18",
            "title": "Zack Snyder's Justice League",
            "video": false,
            "vote_average": 8.5,
            "vote_count": 5432
        },
        {
            "adult": false,
            "backdrop_path": "/suaEOtk1N1sgg2MTM7oZd2cfVp3.jpg",
            "genre_ids": [
                53,
                80
            ],
            "id": 680,
            "original_language": "en",
            "original_title": "Pulp Fiction",
            "overview": "A burger-loving hit man, his philosophical partner, a drug-addled gangster's moll and a washed-up boxer converge in this sprawling, comedic crime caper. Their adventures unfurl in three stories that ingeniously trip back and forth in time.",
            "popularity": 41.947,
            "poster_path": "/x1QZHSq9AzreIVbsp8VgYemAjV0.jpg",
            "release_date": "1994-09-10",
            "title": "Pulp Fiction",
            "video": false,
            "vote_average": 8.5,
            "vote_count": 21080
        },
        {
            "adult": false,
            "backdrop_path": "/qqHQsStV6exghCM7zbObuYBiYxw.jpg",
            "genre_ids": [
                18
            ],
            "id": 389,
            "original_language": "en",
            "original_title": "12 Angry Men",
            "overview": "The defense and the prosecution have rested and the jury is filing into the jury room to decide if a young Spanish-American is guilty or innocent of murdering his father. What begins as an open and shut case soon becomes a mini-drama of each of the jurors' prejudices and preconceptions about the trial, the accused, and each other.",
            "popularity": 20.47,
            "poster_path": "/ppd84D2i9W8jXmsyInGyihiSyqz.jpg",
            "release_date": "1957-04-10",
            "title": "12 Angry Men",
            "video": false,
            "vote_average": 8.5,
            "vote_count": 5563
        },
        {
            "adult": false,
            "backdrop_path": "/9guoVF7zayiiUq5ulKQpt375VIy.jpg",
            "genre_ids": [
                16,
                28,
                14,
                12
            ],
            "id": 592350,
            "original_language": "ja",
            "original_title": "僕のヒーローアカデミア THE MOVIE ヒーローズ：ライジング",
            "overview": "Class 1-A visits Nabu Island where they finally get to do some real hero work. The place is so peaceful that it's more like a vacation … until they're attacked by a villain with an unfathomable Quirk! His power is eerily familiar, and it looks like Shigaraki had a hand in the plan. But with All Might retired and citizens' lives on the line, there's no time for questions. Deku and his friends are the next generation of heroes, and they're the island's only hope.",
            "popularity": 298.862,
            "poster_path": "/zGVbrulkupqpbwgiNedkJPyQum4.jpg",
            "release_date": "2019-12-20",
            "title": "My Hero Academia: Heroes Rising",
            "video": false,
            "vote_average": 8.5,
            "vote_count": 701
        },
        {
            "adult": false,
            "backdrop_path": "/uWVkEo9PWHu9algZsiLPi6sRU64.jpg",
            "genre_ids": [
                36,
                10402,
                18
            ],
            "id": 556574,
            "original_language": "en",
            "original_title": "Hamilton",
            "overview": "Presenting the tale of American founding father Alexander Hamilton, this filmed version of the original Broadway smash hit is the story of America then, told by America now.",
            "popularity": 13.143,
            "poster_path": "/h1B7tW0t399VDjAcWJh8m87469b.jpg",
            "release_date": "2020-07-03",
            "title": "Hamilton",
            "video": false,
            "vote_average": 8.5,
            "vote_count": 718
        },
        {
            "adult": false,
            "backdrop_path": "/pm0RiwNpSja8gR0BTWpxo5a9Bbl.jpg",
            "genre_ids": [
                12,
                14,
                28
            ],
            "id": 122,
            "original_language": "en",
            "original_title": "The Lord of the Rings: The Return of the King",
            "overview": "Aragorn is revealed as the heir to the ancient kings as he, Gandalf and the other members of the broken fellowship struggle to save Gondor from Sauron's forces. Meanwhile, Frodo and Sam take the ring closer to the heart of Mordor, the dark lord's realm.",
            "popularity": 69.808,
            "poster_path": "/rCzpDGLbOoPwLjy3OAm5NUPOTrC.jpg",
            "release_date": "2003-12-01",
            "title": "The Lord of the Rings: The Return of the King",
            "video": false,
            "vote_average": 8.5,
            "vote_count": 17609
        }
    ],
    "total_pages": 437,
    "total_results": 8733
}
end
