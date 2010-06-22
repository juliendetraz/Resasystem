module RoomsHelper
  
  def list_room_type
    [
      [t('member.room.rooms_type.bedroom'),      'bedroom'], 
      [t('member.room.rooms_type.bathroom'),     'bathroom'],
      [t('member.room.rooms_type.kitchen'),      'kitchen'],
      [t('member.room.rooms_type.dinningroom'),  'dinningroom'],
      [t('member.room.rooms_type.livingroom'),   'livingroom']
    ]
  end
  
end
