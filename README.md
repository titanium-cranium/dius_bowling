# DiUS Bowling App

## from Brendan
Hi there.  I just wanted to say thanks to anyone reviewing the code I've created here. I enjoyed doing the challenge and
look forward to any feedback you have. It will be greatly appreciated and help me grow as a developer. It might help to
review the commits as some elements appear and disappear again during development. As requested it does not use any
framework, nor any gems aside from rspec. And, many thanks for finally forcing me to learn how the scoring works in
bowling! I've played occasionally with the family for yonks but never bothered until now, and I had fun doing it. :-)


## Description
This app uses ruby to create an Object Oriented design modeled on the bowling domain. I attempted to use plain language
as much as possible for method names, and the rspec testing framework for its descriptive language. The app consists of
only two objects, Game and Frame which interact to simulate a classic 10 pin bowling game.

### Requirements
```
ruby '3.0.0'
bundler
```

### Testing
In the terminal, run:
```
bundle install
rspec
```

### Objects

#### Game:
When instantiated the game object creates an array containing 10 frames and will simulate an entire game when
`game.play` is called.  It has no attributes of its own really other than allowing access to the array of frames,
mainly this is to allow rspec to test the `total_score` method under specific scoring situations documented in
the rspec tests.

It also has two private methods that are invoked by the `total_score` method to handle the scoring of frames containing
'strikes' and 'spares' as they must be handled differently than 'open frames' where less than 10 pins were knocked down.  
These are tested indirectly in `game_spec.rb` by simulating perfect games (all strikes) and perfect spares (all spares).

#### Frame:
The frame model resembles the typical way in which a bowling game advances.  Each frame has `ball_one` and `ball_two`
attributes which start out as nil when instantiated and are replaced with a simulated random score `roll` as each ball
is 'rolled' during the match (`frame.bowl`). The frame object will also return a compacted array of the results of all 
three balls (`frame.results`) which is used during scoring after all the frames are completed.

Frame ten, however, is special in that it allows three, not two, rolls if a strike or spare occurs. This is handled
by the private `endgame` method to update the `ball_three` attribute (as required by the situation, strike or spare) 
of the frame which is otherwise unused by all other frames.
