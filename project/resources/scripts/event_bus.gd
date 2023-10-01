extends Node


#-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
# Emitters
# I'm not listing emitters for this because we should really only ever
# be emitting this signal temporarily and manually as a developer.
# This shouldn't be used in the final game. Just a utility! :)

# Listeners
# TBD

# A global signal used to send a message to the DebugText node under
# the Main node
# warning-ignore:unused_signal
signal debug_message_received(message)

#-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
# Emitters
# score_manager

# Listeners
# TBD

# A score-related signal emitted by the score manager when the score is changed
# warning-ignore:unused_signal
signal score_updated(score)

#-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
# Emitters
# TBD

# Listeners
# score_manager.gd

# A signal that triggers an addition to the current score
# warning-ignore:unused_signal
signal score_addition_requested(amount)

#-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
# Emitters
# TBD

# Listeners
# score_manager.gd

# A signal that triggers the score to be set to the passed value. Unsure if needed.
# warning-ignore:unused_signal
signal score_set_requested(value)

#-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
# Emitters
# TBD

# Listeners
# hp_manager.gd - _on_player_damaged

# A signal used to decrease player HP
# warning-ignore:unused_signal
signal player_damaged(amount: int)

#-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
# Emitters
# TBD

# Listeners
# hp_manager.gd - _on_player_healed

# A signal used to increase player HP
# warning-ignore:unused_signal
signal player_healed(amount: int)

#-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
# Emitters
# back_button.gd - _pressed

# Listeners
# TBD

# A signal used to take the player back by one menu while navigating UI
# warning-ignore:unused_signal
signal ui_return_requested
