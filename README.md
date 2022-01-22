# Flutter Architecture

Projelerinizde kullanabileceğiniz flutter mimarisi. [ Update: 22.01.2022 ]

#

"lib" klasörünü projenizin lib klasörü ile değiştirerek kullanabilirsiniz. Projenizde kullanılmayacak klasörleri silebilirsiniz.

C# katman mimarisinden esinlenilerek yapılmıştır.

NOT: Gerekli kütüphaneler yüklü değilse hata alabilirsiniz.

#

### Kullanılan kütüphaneler:

- API Service
  - dio
- Widgets
  - animator
  - another_flushbar
- Cache
  - hive
  - hive_flutter
- Other
  - intl
  - mask_text_input_formatter
  - flutter_svg

<br>

# Mimari

### İş Katmanı ( [business](https://github.com/cihatyalman/flutter_architecture/tree/master/lib/business) )

- #### [constants](https://github.com/cihatyalman/flutter_architecture/tree/master/lib/business/constants): Projede kullanılacak sabitler burada tutulur. Bunlar renk, icon, resim, yazı, yazı formatı gibi alanlar olabilir.
- #### [helpers](https://github.com/cihatyalman/flutter_architecture/tree/master/lib/business/helpers): Kodlama yaparken bize yardımcı olacak kodlar burada tutulur.
- #### [managers](https://github.com/cihatyalman/flutter_architecture/tree/master/lib/business/managers): Bazı servislerin bir yerden yönetilmesi gerekir yönetici sınıfları burada tutulur.
- #### [services](https://github.com/cihatyalman/flutter_architecture/tree/master/lib/business/services): Api istekleri (signIn, signOut, accountGet vs.) burada tutulur.
- #### [state_managements](https://github.com/cihatyalman/flutter_architecture/tree/master/lib/business/state_managements): Flutter da kullandığımız durum yöneticileri burada tutulur.

### UI Katmanı ( [ui](https://github.com/cihatyalman/flutter_architecture/tree/master/lib/ui) )

- #### [screens](https://github.com/cihatyalman/flutter_architecture/tree/master/lib/ui/screens): Tasarlanan uygulama ekranları burada tutulur.
- #### [widgets/custom_widgets](https://github.com/cihatyalman/flutter_architecture/tree/master/lib/ui/widgets/custom_widgets): Projeden bağımsız olarak oluşturulan widgetlar burada tutulur.
- #### [widgets/project_widgets](https://github.com/cihatyalman/flutter_architecture/tree/master/lib/ui/widgets/project_widgets): Projeye özgü widgetlar burada tutulur.

### Çekirdek Katman ( [core](https://github.com/cihatyalman/flutter_architecture/tree/master/lib/core) )

- #### Bu katman projeden bağımsız olarak çalışan kodlar içerir.
- #### Bu katmanı [dışarıdan](https://github.com/cihatyalman/flutter_core) entegre edebilirsiniz.

### Model Katmanı ( [models](https://github.com/cihatyalman/flutter_architecture/tree/master/lib/models) )

- #### Projede kullanılacak modeller burada tutulur.

### Export Katmanı ( [exports](https://github.com/cihatyalman/flutter_architecture/tree/master/lib/exports) )

- #### import ettiğimiz sınıfları toplu bir halde tutmamızı sağlar.

<br>

# Ekran Tasarımı

Ekran tasarımı 3 ana bileşen üzerine kurulmuştur. Bu bileşenler tek bir 'dart' dosyası içinde 3 ayrı sınıftan oluşur. Örnek olarak [Home](https://github.com/cihatyalman/flutter_architecture/tree/master/lib/ui/screens/home_screen.dart) ekranını inceleyebilirsiniz.

- #### Veri Sınıfı ( \_ScreenData ):
  Tasarladığınız ekranda bir veri işlemi varsa (input, dropdown vs.) bu sınıf kullanılır. Ekran açıldığında bu sınıftan bir obje oluşturulur ve gerekli ise doldurulur. Yapılan veri değişiklikleri bu sınıf üzerinden yapılır. Bu şekilde kaydedilmediği sürece o ekranda olanlar o ekranda kalır.
- #### Widget Sınıfı ( \_ScreenWidgets ):

  Ekran için tasarlanan widgetlar bu sınıf altında bir metot olarak tutulur.

- #### Ana Sınıf ( . . . Screen ):
  Bu sınıf ana sınıfımız olacak. Bu sınıfta widget sınıfında hazırladığımız widgetları yerleştireceğiz, konumlarını ayarlayacağız, widgetlar arası boşluklar vereceğiz.

<br>

Sonuç olarak widget sınıfında widgetlarımızı ayrı ayrı tasarlayıp, ana sınıfımızda bu widgetları sadece konumlandıracağız. Bu şekilde konum bazlı bir revizeyi ana sınıfta, widget bazlı bir revizeyi widget sınıfında bulup yapabiliriz.

<br>

# State Managements
Kişisel olarak 'Stateful' yerine 'Stateless' kullanıyorum. Ekranda yapılan kalıcı olmayan anlık değişiklikler (butonu duruma göre değiştirmek vs.) için 'ValueNotifier', anlık olarak ekrana yansıyacak veri değişiklikleri (profil ismi, profil resmi vs.) için 'Bloc' kullanmayı tercih ediyorum.

<br>

# Flutter Snippet
Kod yazarken bize yardımcı olacak hazır [kod parçaları](https://github.com/cihatyalman/flutter_architecture/tree/master/flutter.code-snippets).

