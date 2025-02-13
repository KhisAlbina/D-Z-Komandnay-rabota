
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	// СтандартныеПодсистемы.ПодключаемыеКоманды
	ПодключаемыеКоманды.ПриСозданииНаСервере(ЭтотОбъект);
	// Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
	//А - Начало изменений
	//Хисамеева А.Г. - 20.07.2024
	
	А_ДобавитьКомандуПересчитатьТаблицуИПолеВводаСогласованнаяСкидкаВГруппаШапкаЛево();
	//А - Конец изменений
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиент.НачатьОбновлениеКоманд(ЭтотОбъект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗаписи(ПараметрыЗаписи)
    ПодключаемыеКомандыКлиент.ПослеЗаписи(ЭтотОбъект, Объект, ПараметрыЗаписи);
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыТовары

&НаКлиенте
Процедура ТоварыКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

&НаКлиенте
Процедура ТоварыСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыУслуги

&НаКлиенте
Процедура УслугиКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура РассчитатьСуммуСтроки(ТекущиеДанные)
	
	//А - Начало изменений
	//Хисамеева А.Г. - 20.07.2024
	
	//КоэффициентСкидки = 1 - ТекущиеДанные.Скидка / 100;
	//ТекущиеДанные.Сумма = ТекущиеДанные.Цена * ТекущиеДанные.Количество * КоэффициентСкидки;
	
	СуммаСкидок = ТекущиеДанные.Скидка + Объект.А_СогласованнаяСкидка;
			
	Если СуммаСкидок > 100 Тогда
		СуммаСкидок = 100; 
	КонецЕсли; 
	
	КоэффициентСкидки = 1 - СуммаСкидок/100;
	ТекущиеДанные.Сумма = ТекущиеДанные.Цена * ТекущиеДанные.Количество * КоэффициентСкидки; 
	
	//А-Конец изменений
	
КонецПроцедуры

&НаКлиенте
Процедура РассчитатьСуммуДокумента()
	
	Объект.СуммаДокумента = Объект.Товары.Итог("Сумма") + Объект.Услуги.Итог("Сумма");
	
КонецПроцедуры

#Область ПодключаемыеКоманды

// СтандартныеПодсистемы.ПодключаемыеКоманды
&НаКлиенте
Процедура Подключаемый_ВыполнитьКоманду(Команда)
    ПодключаемыеКомандыКлиент.НачатьВыполнениеКоманды(ЭтотОбъект, Команда, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ПродолжитьВыполнениеКомандыНаСервере(ПараметрыВыполнения, ДополнительныеПараметры) Экспорт
    ВыполнитьКомандуНаСервере(ПараметрыВыполнения);
КонецПроцедуры

&НаСервере
Процедура ВыполнитьКомандуНаСервере(ПараметрыВыполнения)
    ПодключаемыеКоманды.ВыполнитьКоманду(ЭтотОбъект, ПараметрыВыполнения, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ОбновитьКоманды()
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
КонецПроцедуры
// Конец СтандартныеПодсистемы.ПодключаемыеКоманды

#КонецОбласти

#Область А_ДополнительныеПроцедурыИФункции 

&НаСервере
Процедура А_ДобавитьКомандуПересчитатьТаблицуИПолеВводаСогласованнаяСкидкаВГруппаШапкаЛево() 
	//А - Начало изменений
	//Хисамеева А.Г. - 20.07.2024

	ПолеВвода = Элементы.Добавить("СогласованнаяСкидка", Тип("ПолеФормы"), Элементы.ГруппаШапкаЛево);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.А_СогласованнаяСкидка"; 
    ПолеВвода.УстановитьДействие("ПриИзменении", "А_СогласованнаяСкидкаПриИзмененииДанных"); 
	
	НоваяКоманда = Команды.Добавить("А_ПересчитатьТаблицу");
	НоваяКоманда.Заголовок = "ПересчитатьТаблицу";
	НоваяКоманда.Действие = "А_ПересчитатьТаблицу";
	
	Кнопка = Элементы.Добавить ("ПересчитатьТаблицу", Тип("КнопкаФормы"),Элементы.ГруппаШапкаЛево);
	Кнопка.ИмяКоманды = "А_ПересчитатьТаблицу";   
	
    //А - Конец изменений 
	
КонецПроцедуры  

 &НаКлиенте
 Процедура А_ПересчитатьТаблицу (Команда)
	//А - Начало изменений
	//Хисамеева А.Г. - 20.07.2024
	
	А_ПересчитатьТаблицуВЦикле() 
	
    //А - Конец изменений 

 КонецПроцедуры
 
 &НаКлиенте
Асинх Процедура А_СогласованнаяСкидкаПриИзмененииДанных(Элемент)
	//А - Начало изменений
	//Хисамеева А.Г. - 20.07.2024

	Если Объект.Товары.Количество()> 0 Или Объект.Услуги.Количество()> 0 Тогда
		Обещание = ВопросАсинх(НСтр("ru='Необходимо ли пересчитать табличную часть с учетом новой скидки?'"), РежимДиалогаВопрос.ДаНет, , КодВозвратаДиалога.Да);
		Результат = Ждать Обещание; // тут выполнение остановится пока пользователь не ответит на вопрос
		Если Результат = КодВозвратаДиалога.Да Тогда
			А_ПересчитатьТаблицуВЦикле()
		КонецЕсли;
	КонецЕсли;  
	
	//А - Конец изменений 

КонецПроцедуры 

 &НаКлиенте
Процедура А_ПересчитатьТаблицуВЦикле()
	//А - Начало изменений
	//Хисамеева А.Г. - 20.07.2024

	Для Каждого Строка Из Объект.Товары Цикл
		РассчитатьСуммуСтроки(Строка);
	КонецЦикла;
	Для Каждого Строка Из Объект.Услуги Цикл
		РассчитатьСуммуСтроки(Строка);
	КонецЦикла;	
	
	//А - Конец изменений 

КонецПроцедуры

#КонецОбласти

#КонецОбласти
