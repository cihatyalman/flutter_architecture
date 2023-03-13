# Flutter Architecture

Projelerinizde kullanabileceğiniz flutter mimarisi. [ Update: 13.03.2023 ]

#

"lib" klasörünü projenizin lib klasörü ile değiştirerek kullanabilirsiniz. Projenizde kullanılmayacak klasörleri silebilirsiniz.

Katmanlı mimari kullanılarak hazırlanmıştır.

NOT: Gerekli kütüphaneler yüklü değilse hata alabilirsiniz.

NOT: cache_service.dart dosyasında bulunan 'cacheName' değişkenini değiştirmeyi unutmayın.

#

### Kullanılan kütüphaneler:

<table>
  <tr valign="top">
    <td>
      <ul>
        <li>API Service</li>
        <ul>
          <li>dio</li>
        </ul>
        <li>Cache</li>
        <ul>
          <li>hive</li>
          <li>hive_flutter</li>
        </ul>
        <li>Widgets</li>
        <ul>
          <li>animator</li>
          <li>another_flushbar</li>
          <li>cached_network_image</li>
        </ul>
      </ul>
    </td>
    <td>
      <li>Other</li>
      <ul>
        <li>intl</li>
        <li>path_provider</li>
        <li>mask_text_input_formatter</li>
        <li>flutter_svg</li>
        <li>auto_size_text</li>
      </ul>
    </td>
  </tr>
</table>

<!-- # api -->
  <!-- dio:  -->
<!--  -->
  <!-- # widgets -->
  <!-- animator:  -->
  <!-- another_flushbar:  -->
  <!-- screenshot:  -->
  <!-- cached_network_image:  -->
<!--  -->
  <!-- # cache -->
  <!-- hive:  -->
  <!-- hive_flutter:  -->
<!--  -->
  <!-- # other -->
  <!-- intl:  -->
  <!-- path_provider:  -->
  <!-- mask_text_input_formatter:  -->
  <!-- flutter_svg:  -->
  <!-- auto_size_text:  -->

<br>

# Mimari

### İş Katmanı ( [business](https://github.com/cihatyalman/flutter_architecture/tree/master/lib/business) )

- #### [constants](https://github.com/cihatyalman/flutter_architecture/tree/master/lib/business/constants): Projede kullanılacak sabitler burada tutulur. Bunlar renk, icon, resim, yazı, yazı formatı gibi alanlar olabilir.
- #### [controllers](https://github.com/cihatyalman/flutter_architecture/tree/master/lib/business/controllers): Api istekleri (signIn, signOut, accountGet vs.) burada tutulur.
- #### [helpers](https://github.com/cihatyalman/flutter_architecture/tree/master/lib/business/helpers): Kodlama yaparken bize yardımcı olacak kodlar burada tutulur.
- #### [managers](https://github.com/cihatyalman/flutter_architecture/tree/master/lib/business/managers): Bazı servislerin bir yerden yönetilmesi gerekir yönetici sınıfları burada tutulur.
- #### [state_managements](https://github.com/cihatyalman/flutter_architecture/tree/master/lib/business/state_managements): Flutter da kullandığımız durum yöneticileri burada tutulur.

### Çekirdek Katman ( [core](https://github.com/cihatyalman/flutter_architecture/tree/master/lib/core) )

- #### Bu katman projeden bağımsız olarak çalışan kodlar içerir.
- #### Bu katmanı [dışarıdan](https://github.com/cihatyalman/flutter_core) entegre edebilirsiniz.

### Model Katmanı ( [models](https://github.com/cihatyalman/flutter_architecture/tree/master/lib/models) )

- #### Projede kullanılacak modeller burada tutulur.

### UI Katmanı ( [ui](https://github.com/cihatyalman/flutter_architecture/tree/master/lib/ui) )

- #### [screens](https://github.com/cihatyalman/flutter_architecture/tree/master/lib/ui/screens): Tasarlanan uygulama ekranları burada tutulur.
- #### [widgets/custom_widgets](https://github.com/cihatyalman/flutter_architecture/tree/master/lib/ui/widgets/custom_widgets): Projeden bağımsız olarak oluşturulan widgetlar burada tutulur.
- #### [widgets/project_widgets](https://github.com/cihatyalman/flutter_architecture/tree/master/lib/ui/widgets/project_widgets): Projeye özgü widgetlar burada tutulur.

<br>

# Ekran Tasarımı

Ekran tasarımı 2 ana bileşen üzerine kurulmuştur. Bu bileşenler tek bir 'dart' dosyası içinde 2 ayrı sınıftan oluşur. Örnek olarak [Home](https://github.com/cihatyalman/flutter_architecture/tree/master/lib/ui/screens/home_screen.dart) ekranını inceleyebilirsiniz.

- #### Widget Sınıfı ( \_ScreenWidgets ):

  Ekran için tasarlanan widgetlar bu sınıf altında bir metot olarak tutulur.

- #### Ana Sınıf ( . . . Screen ):
  Bu sınıf ana sınıfımız olacak. Bu sınıfta widget sınıfında hazırladığımız widgetları yerleştireceğiz, konumlarını ayarlayacağız, widgetlar arası boşluklar vereceğiz.

<br>

Sonuç olarak widget sınıfında widgetlarımızı ayrı ayrı tasarlayıp, ana sınıfımızda bu widgetları sadece konumlandıracağız. Bu şekilde konum bazlı bir değişikliği ana sınıfta, widget bazlı bir değişikliği widget sınıfında bulup yapabiliriz.

<br>

# State Managements
Kişisel olarak 'Stateful' yerine 'Stateless' kullanıyorum. Ekranda yapılan kalıcı olmayan anlık değişiklikler (butonu duruma göre değiştirmek vs.) için 'ValueNotifier', anlık olarak ekrana yansıyacak veri değişiklikleri (profil ismi, profil resmi vs.) için 'BLoC Pattern' kullanmayı tercih ediyorum.

<br>

# Flutter Snippet
Kod yazarken bize yardımcı olacak hazır [kod parçaları](https://github.com/cihatyalman/flutter_architecture/tree/master/flutter.code-snippets).

