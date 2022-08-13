import 'package:flutter/material.dart';

class ListViewBuilderScreen extends StatefulWidget {
  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {
  final List<int> imageId = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  @override

  ///Todo: Utilizamos el initState para obtener el controlador del Lisview y asi saber
  /// Todo: la posicion inicial

  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      /* print(
          '${scrollController.position.pixels} ${scrollController.position.maxScrollExtent}'); */

      if (scrollController.position.pixels + 500 >=
          scrollController.position.maxScrollExtent) {
        //Todo: Este es cuando no se esta utilizando el future
        //add5();
        fetchData();
      }
    });
  }

  Future fetchData() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 3));
    add5();
    isLoading = false;
    setState(() {});
    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) return;

    /// El animatedTo, nos siver para dar una animacion a la posicion
    scrollController.animateTo(
      scrollController.position.pixels + 120,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  //Todo: Metodo para mandar un RefreshIndicator
  Future<void> onRefresh() async {
    //Todo: Mandamos la duracion del que tardara en refrescar
    await Future.delayed(const Duration(seconds: 2));
    //! Guardamos antes el ultimo valor de imagesId.last
    final lastId = imageId.last;
    //! Limpiamos la lista
    imageId.clear();
    //Todo: Agregarmos el ultimo valor a la lista y le sumamos 1
    imageId.add(lastId + 1);
    //Todo: Finalmente mandamos a llamar al metodo add5 para agreagar 5 elementos actualizados
    add5();
  }

  ///Todo: Se utiliza este metod para agregar cinco id mas a la lista inicial
  ///Todo: y asi cargar mas imagenes ya que se recorrera con la funcion map
  ///Todo: y se convertira en el ultimo valor sumandole el valor de la lista
  ///Todo: imageId y se redibuja el widget con setState
  void add5() {
    final lastId = imageId.last;
    imageId.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      //Todo: Se utiliza el MediaQuery para remover la parte blanca del noch del dispositivo y aprovechar toda la pantalla
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Stack(
          children: [
            RefreshIndicator(
              onRefresh: onRefresh,
              child: ListView.builder(
                controller: scrollController,
                itemCount: imageId.length,
                itemBuilder: (BuildContext context, int index) {
                  return FadeInImage(
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                    placeholder: const AssetImage('assets/loading.gif'),
                    image: NetworkImage(
                        //Todo: Se utiliza un banco de imagenes que es 'https://picsum.photos/id/237/200/300' pero se le quito la
                        //Todo: id y los 200 de en medio que es la separacion por foto, se cambia el tamaño del with a 500 y se
                        //Todo: agrega a lado del 300 "?image${index + 1} el +1 para comenzar por primer valor en caso de que no
                        //Todo: haya una imagen 0"
                        'https://picsum.photos/500/300?image${imageId[index]}'),
                    //Todo: Mandamos la lista para dar n cantidad de Ids
                  );
                },
              ),
            ),
            Positioned(
              top: 45,
              left: 10,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                ),
              ),
            ),

            ///Todo: Si el isLoading es true entonces si va a cargar
            ///! Recuerda que se pueden meter instrucciones de codigo en los
            ///! scroll, pero sin el cuerpo que son las {}
            if (isLoading)

              /// El positioned nos sirve para direccionar widget en algun
              /// lugar de la pantalla
              Positioned(
                bottom: 10,
                left: size.width * 0.5 - 20,
                child: const _Loading(),
              )
          ],
        ),
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5), shape: BoxShape.circle),
      child: const CircularProgressIndicator(),
    );
  }
}
