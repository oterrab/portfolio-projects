select * from nashville.dbo.[Nashville Housing Data for Data Cleaning];

-- Standardize date format

select SaleDate
from nashville.dbo.[Nashville Housing Data for Data Cleaning];

update nashville.dbo.[Nashville Housing Data for Data Cleaning]
set SaleDate= convert(date, SaleDate, 103);

-- Populate Property address data

select * from nashville.dbo.[Nashville Housing Data for Data Cleaning];

select *
from nashville.dbo.[Nashville Housing Data for Data Cleaning]
where PropertyAddress is null;

select *
from nashville.dbo.[Nashville Housing Data for Data Cleaning]
order by ParcelID;

select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress, b.PropertyAddress)
from nashville.dbo.[Nashville Housing Data for Data Cleaning] a
JOIN nashville.dbo.[Nashville Housing Data for Data Cleaning] b
    on a.[ParcelID] = b.ParcelID
    and a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null;

update a
set PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
from nashville.dbo.[Nashville Housing Data for Data Cleaning] a
JOIN nashville.dbo.[Nashville Housing Data for Data Cleaning] b
    on a.[ParcelID] = b.ParcelID
    and a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null;

-- Breaking out address into individual columns (address, city, state)

--- Property
select * from nashville.dbo.[Nashville Housing Data for Data Cleaning];

select PropertyAddress
from nashville.dbo.[Nashville Housing Data for Data Cleaning];

select
    substring(PropertyAddress, 1, charindex(',', PropertyAddress) -1) as Address,
    substring(PropertyAddress, charindex(',', PropertyAddress) +1, LEN(PropertyAddress) ) as City
from nashville.dbo.[Nashville Housing Data for Data Cleaning];

Alter table nashville.dbo.[Nashville Housing Data for Data Cleaning]
add PropertuSplitAddress nvarchar(255);

update nashville.dbo.[Nashville Housing Data for Data Cleaning]
set PropertuSplitAddress = substring(PropertyAddress, 1, charindex(',', PropertyAddress) -1);

Alter table nashville.dbo.[Nashville Housing Data for Data Cleaning]
add PropertuSplitCity nvarchar(255);

update nashville.dbo.[Nashville Housing Data for Data Cleaning]
set PropertuSplitCity = substring(PropertyAddress, charindex(',', PropertyAddress) +1, LEN(PropertyAddress) );

select * from nashville.dbo.[Nashville Housing Data for Data Cleaning];

--- Owner

select * from nashville.dbo.[Nashville Housing Data for Data Cleaning];

select OwnerAddress
from nashville.dbo.[Nashville Housing Data for Data Cleaning];

select
    parsename(REPLACE(OwnerAddress, ',', '.'), 3),
    parsename(REPLACE(OwnerAddress, ',', '.'), 2),
    parsename(REPLACE(OwnerAddress, ',', '.'), 1)
from nashville.dbo.[Nashville Housing Data for Data Cleaning];

Alter table nashville.dbo.[Nashville Housing Data for Data Cleaning]
add OwnerSplitAddress nvarchar(255);

update nashville.dbo.[Nashville Housing Data for Data Cleaning]
set OwnerSplitAddress = parsename(REPLACE(OwnerAddress, ',', '.'), 3);

Alter table nashville.dbo.[Nashville Housing Data for Data Cleaning]
add OwnerSplitCity nvarchar(255);

update nashville.dbo.[Nashville Housing Data for Data Cleaning]
set OwnerSplitCity = parsename(REPLACE(OwnerAddress, ',', '.'), 2);

Alter table nashville.dbo.[Nashville Housing Data for Data Cleaning]
add OwnerSplitState nvarchar(255);

update nashville.dbo.[Nashville Housing Data for Data Cleaning]
set OwnerSplitState = parsename(REPLACE(OwnerAddress, ',', '.'), 1);

select * from nashville.dbo.[Nashville Housing Data for Data Cleaning];

-- Change Y and N to Yes and No in "Sold as Vacant" field

select Distinct(SoldAsVacant), count(SoldAsVacant)
from nashville.dbo.[Nashville Housing Data for Data Cleaning]
group by SoldAsVacant
order by 2;

select SoldAsVacant,
       case when SoldAsVacant = 'Y' THEN 'Yes'
            when SoldAsVacant = 'N' THEN 'No'
            else SoldAsVacant
            end
from nashville.dbo.[Nashville Housing Data for Data Cleaning];

update nashville.dbo.[Nashville Housing Data for Data Cleaning]
set SoldAsVacant = case when SoldAsVacant = 'Y' THEN 'Yes'
            when SoldAsVacant = 'N' THEN 'No'
            else SoldAsVacant
            end;

-- Remove Duplicates

select * from nashville.dbo.[Nashville Housing Data for Data Cleaning];

WITH RowNumCTE as (select *,
                          ROW_NUMBER() over (
                              PARTITION BY ParcelID,
                              PropertyAddress,
                              SalePrice,
                              SaleDate,
                              LegalReference
                              ORDER BY
                                  [UniqueID ]
                              ) row_num
                   from nashville.dbo.[Nashville Housing Data for Data Cleaning]
                   )


DELETE
from RowNumCTE
where row_num>1;

-- Delete Unused Columns

select *
from nashville.dbo.[Nashville Housing Data for Data Cleaning];

alter table nashville.dbo.[Nashville Housing Data for Data Cleaning]
drop column OwnerAddress, TaxDistrict, PropertyAddress;

alter table nashville.dbo.[Nashville Housing Data for Data Cleaning]
drop column SaleDate;

