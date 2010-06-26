module ServicesHelper

  def list_services_type
    [
      [t('member.service.services_type.comfort'),   'comfort'], 
      [t('member.service.services_type.asset'),     'asset'],
      [t('member.service.services_type.activity'),  'activity']
    ]
  end

#  def list_services_comfort
#    [
#      [t('member.service.comfort.comfort_type.washing_maching'),    'washing_maching'], 
#      [t('member.service.comfort.comfort_type.refrigerator'),       'refrigerator'],
#      [t('member.service.comfort.comfort_type.dryer'),              'dryer'],
#      [t('member.service.comfort.comfort_type.freezer'),            'freezer'],
#      [t('member.service.comfort.comfort_type.hotplates'),          'hotplates'],
#      [t('member.service.comfort.comfort_type.iron'),               'iron'],
#      [t('member.service.comfort.comfort_type.oven'),               'oven'],
#      [t('member.service.comfort.comfort_type.dishwasher'),         'dishwasher']
#    ]
#  end

end
