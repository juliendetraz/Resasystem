module HousingsHelper

  def list_housing_distances
    [
      [t('member.housing.housing_distances.less_100m'), 'less_100m'],
      [t('member.housing.housing_distances.less_1km'),  'less_1km'],
      [t('member.housing.housing_distances.less_5km'),  'less_5km'],
      [t('member.housing.housing_distances.less_10km'), 'less_10km'],
      [t('member.housing.housing_distances.less_50km'), 'less_50km'],
      [t('member.housing.housing_distances.less_100km'),'less_100km']
    ]
  end

  def get_latitude
    (50 - (rand * rand(8)))
  end

  def get_longitude
    (6 - (rand * rand(10)))
  end
end
